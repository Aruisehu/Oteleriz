class Admin::DishesController < Admin::BaseController
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
            redirect_to admin_dish_path(@dish)
        else
            redirect_to new_admin_dish_path
        end
    end

    def edit
        @dishes = Dish.all
    end

    def update
        @dish.assign_attributes(dish_params)
        if @dish.save
            redirect_to admin_dish_path(@dish)
        else
            redirect_to edit_admin_dish_path
        end
    end

end