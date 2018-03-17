class Admin::DishesController < Admin::BaseController
    before_action :set_dish, only: [:edit, :update, :show, :destroy]
    def new
        @dish = Dish.new
    end

    def index
        @dishes = Dish.all 
    end

    def create
        @dish = Dish.new(dish_params)
        if @dish.save
            redirect_to admin_dishes_path
        else
            redirect_to admin_dishes_path
        end
    end

    def edit
        @dish = Dish.find(params[:id]) 
    end

    def update
        @dish.assign_attributes(dish_params)
        if @dish.save
            redirect_to admin_dishes_path
        else
            redirect_to edit_admin_dishes_path
        end
    end

    def destroy
        @dish.destroy
        redirect_to admin_dishes_path
    end

    private

    def set_dish
        @dish = Dish.find(params[:id])
    end

    def dish_params
      params.require(:dish).permit(:name_en, :name_fr, :description_fr, :description_en, :ask_roasting, :price, :img_url)
    end
end