class Admin::ServicesController < Admin::BaseController
    before_action :set_service, only: [:edit, :update, :show, :destroy]
    def new
        @service = Service.new
    end

    def index
        @services = Service.all 
    end

    def create
        @service = service.new(service_params)
        if @service.save
            redirect_to admin_services_path
        else
            redirect_to admin_services_path
        end
    end

    def edit
        @service = Service.find(params[:id]) 
    end

    def update
        @service.assign_attributes(service_params)
        if @service.save
            redirect_to admin_services_path
        else
            redirect_to edit_admin_services_path
        end
    end

    def destroy
        @service.destroy
        redirect_to admin_services_path
    end

    private

    def set_service
        @service = Service.find(params[:id])
    end

    def service_params
      params.require(:service).permit(:end_time, :start_time)
    end
end