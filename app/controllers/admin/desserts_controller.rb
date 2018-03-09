class Admin::DessertsController < Admin::BaseController
    before_action :set_dessert, only: [:edit, :update, :show, :destroy]
    def new
        @dessert = Dish.new
    end

    def index
        @desserts = Dish.all 
    end

    def create
        @dessert = Dish.new(dessert_params)
        if @dessert.save
            redirect_to admin_desserts_path
        else
            redirect_to admin_desserts_path
        end
    end

    def edit
        @dessert = Dish.find(params[:id]) 
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
        @dessert = Dish.find(params[:id])
    end

    def dessert_params
      params.require(:dessert).permit(:name_translations, :description_translations, :ask_roasting, :price, :img_url)
    end
end