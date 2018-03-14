class Admin::DessertsController < Admin::BaseController
    before_action :set_dessert, only: [:edit, :update, :show, :destroy]
    def new
        @dessert = Dessert.new
    end

    def index
        @desserts = Dessert.all 
    end

    def create
        @dessert = Dessert.new(dessert_params)
        if @dessert.save
            redirect_to admin_desserts_path
        else
            redirect_to admin_desserts_path
        end
    end

    def edit
        @dessert = Dessert.find(params[:id]) 
    end

    def update
        @dessert.assign_attributes(dessert_params)
        if @dessert.save
            redirect_to admin_desserts_path
        else
            redirect_to edit_admin_desserts_path
        end
    end

    def destroy
        @dessert.destroy
        redirect_to admin_desserts_path
    end

    private

    def set_dessert
        @dessert = Dessert.find(params[:id])
    end

    def dessert_params
      params.require(:dessert).permit(:name_en, :name_fr, :description_fr, :description_en, :price, :img_url)
    end
end