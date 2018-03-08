class Admin::DishesController < Admin::BaseController
    before_action :set_dish, only: [:edit, :update, :show, :destroy]
    def new
        @dish = Dish.new
    end

    def index
        @dishes = Dish.all 
    end
    
    def show
        @dishes = Dish.find(params[:id]) 
    end

    def create
        @dish = Dish.new(dish_params)
        if @dish.save
            redirect_to admin_dishes_path(@dish)
        else
            redirect_to admin_dishes_path
        end
    end

    def edit
        @dishes = Dish.find(params[:id]) 
    end

    def update
        @dish.assign_attributes(dish_params)
        if @dish.save
            redirect_to admin_dishes_path(@dish)
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
      params.require(:dish).permit(:name_translations, :description_translations, :ask_roasting, :price, :img_url)
    end
end