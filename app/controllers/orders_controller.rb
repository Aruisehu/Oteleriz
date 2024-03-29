class OrdersController < ApplicationController

    before_action :access_click_and_sit, only: [:update, :destroy, :add_menu, :booking, :validate_booking, :success]
    before_action :close_services, only: [:booking, :validate_booking]

    def index
        @dishes = Dish.all
        @desserts = Dessert.all
        @starters = Starter.all
        @bakings = Baking.includes(:marinades).all
        @marinades = Marinade.all
        @course_starter = FormulaTemplate.find_by(has_starter: true, has_dish: false, has_dessert: false, has_wine: false)
        @course_d = FormulaTemplate.find_by(has_starter: false, has_dish: true, has_dessert: false, has_wine: false)
        @course_dessert = FormulaTemplate.find_by(has_starter: false , has_dish: false, has_dessert: true, has_wine: false)
        @course_sd = FormulaTemplate.find_by(has_starter: true, has_dish: true, has_dessert: false, has_wine: false)
        @course_sdw = FormulaTemplate.find_by(has_starter: true, has_dish: true, has_dessert: false, has_wine: true)
        @course_dd = FormulaTemplate.find_by(has_starter: false, has_dish: true, has_dessert: true, has_wine: false)
        @course_ddw = FormulaTemplate.find_by(has_starter: false, has_dish: true, has_dessert: true, has_wine: true)
        @course_sdd = FormulaTemplate.find_by(has_starter: true, has_dish: true, has_dessert: true, has_wine: false)
        @course_sddw = FormulaTemplate.find_by(has_starter: true, has_dish: true, has_dessert: true, has_wine: true)

        @title = "Notre Carte"

        if session[:access]
            render "index"
        else
            render "carte"
        end
    end

    def show
        @order = Order.find(params[:id])
    end

    def access
        if session[:access]
            flash[:success] = I18n.t("orders.success.session")
            redirect_to orders_path
        end
    end

    def post_access
        if params[:access] == Global.access_token
            session[:access] = true
            flash[:success] = I18n.t("orders.success.session2")
            redirect_to orders_path
        else
            session[:access] = nil
            flash[:error] = I18n.t("orders.error.post_access")
            redirect_to order_access_path
        end
    end

    def update
        @formula = Formula.new(
            {
                starter_id: formula_params[:starter],
                dish_id: formula_params[:dish],
                dessert_id: formula_params[:dessert],
                roasting: formula_params[:roasting],
                baking_id: formula_params[:baking],
                order: @order
            }.compact
        )

        set_template
        add_formula

        redirect_to orders_path
    end

    def destroy
        @formula = Formula.find(params.require(:formula))

        if @order.formulas.include? @formula
            @order_price = @formula.destroy_from_order
        end

        respond_to do |f|
            f.html { redirect_to orders_path }
            f.js
        end
    end

    def add_menu
        if params[:id]
            @formula_template = FormulaTemplate.find(params[:id])
        else
            @formula_template = FormulaTemplate.find_by(has_dish: true, has_dessert: false, has_starter: false, has_wine: false)
        end
    end

    def booking
        meal = Meal.where("DATE(start_time) = ?", Date.today)
        unless meal.empty?
            @services = meal.first.services.includes(:orders).opened # fetch all services from today meal
        else
            redirect_to order_not_available_path
        end
    end

    def validate_booking
        if params[:grouped?] == "true"
            @order.assign_attributes(order_params)
        else
            @order.assign_attributes(order_params.except(:number_persons))
        end

        unless @order.service
            flash[:error] = I18n.t("orders.error.no_hour")
        end

        # unless @order.email
        if @order.email.blank?
            flash[:error] = I18n.t("orders.error.no_email")
        end

        unless flash[:error].blank?
            redirect_to order_booking_path
            return
        end

        if @order.service.meal.start_time.today? # Verify that the service is today since we don't accept preorders
            unless @order.service.remaining_seats?(@order.number_persons || 1)
                flash[:error] = I18n.t("orders.error.no_seats")
                redirect_to order_booking_path
                return
            end

            if !params[:group_name].empty? && params[:grouped?] != "true" # If the customer specified a group name and didn't select a group order
                paired = Order.where(name: params[:group_name], service: @order.service).first
                if paired.blank?
                    flash[:error] = I18n.t("orders.error.person_not_found")
                    redirect_to order_booking_path
                    return
                end
                @order.group = paired.group
            elsif @order.group.blank?
                @order.create_group # Amazingly this method is generated by rails (:ok_hand:)
            end

            @order.confirmed = true
            if @order.save # If the order can be saved
                session.delete(:order_id) # we close it to further edits
                OrdersMailer.confirm(@order).deliver_now
                flash[:success] = I18n.t("orders.success.order_confirmed")
                redirect_to order_success_path # and redirect user to the success page
                return
            end
        else
            redirect_to order_not_available_path
            return
        end
        flash[:error] = @order.errors.messages.map do |k, v| v end.flatten.join("\n")
        redirect_to order_booking_path
        return
    end

    def success
    end

    def not_available
        flash.now[:error] = I18n.t("orders.error.no_order")
        render "not_available", status: 403
    end

    private
    def set_template
        @formula.formula_template = FormulaTemplate.find(params[:id_template])
    end

    def add_formula
        if @formula.valid_template? && @formula.save
            @order.formulas << @formula

            if @order.save
                flash[:success] = I18n.t("orders.success.product_added")
            else
                flash[:error] = I18n.t("orders.error.standard")
            end
        else
            flash[:error] = I18n.t("orders.error.standard")
        end
    end

    def formula_params
        params.require(:formula).permit(:starter, :dish, :dessert, :baking, :roasting)
    end

    def order_params
        params.require(:order).permit(:service_id, :name, :number_persons, :email)
    end

    def access_click_and_sit
        unless session[:access]
            redirect_to order_access_path and return
        end
    end

    def close_services
        services = Service.opened
        services.each do |s|
            if (s.start_time - 10.minutes).past?
                s.ended = true
                s.save
            end
        end
    end
end
