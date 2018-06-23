module Api
end

class Api::QuestionsController < ApplicationController

    def last_meal
        @order = Order.where(email: params[:email])
            .includes(:service, formulas: [:dish, :starter, :dessert, :formula_template])
            .order("services.start_time desc")
            .first
        if @order.blank?
            render json: {}, status: :not_found
        else
            render json: @order,
                include: [formulas: {
                include: [:dish, :dessert, :starter, :formula_template],
                only: [:roasting]
            }],
            except: [:newsletter, :confirmed, :group_id, :service_id]
        end
    end

    def create
        render json: {}, status: :ok
    end
end
