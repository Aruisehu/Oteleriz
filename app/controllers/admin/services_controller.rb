class Admin::ServicesController < Admin::BaseController
    before_action :set_service, only: [:edit, :update, :show, :destroy]
    def new
        @meal = Meal.find(params[:meal_id])
        @service = Service.new
    end

    def index
        @services = Service.all
    end

    def create
        @service = Service.new(service_params)
        if @service.save
            redirect_to admin_meal_path(@service.meal)
        else
            redirect_to admin_services_path
        end
    end

    def edit
    end

    def update
        @service.assign_attributes(service_params)
        if @service.save
            redirect_to admin_meal_path(@service.meal)
        else
            redirect_to edit_admin_services_path
        end
    end

    def destroy
        @meal = @service.meal
        @service.destroy
        redirect_to admin_meal_path(@meal)
    end

    private

    def set_service
        @service = Service.find(params[:id])
    end

    def service_params
      params.require(:service).permit(:end_time, :start_time, :meal_id)
    end
end
