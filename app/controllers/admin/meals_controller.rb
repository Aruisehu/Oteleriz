class Admin::MealsController < Admin::BaseController
    before_action :set_meal, only: [:edit, :update, :show, :destroy]
    def new
        @meal = Meal.new
    end

    def index
        @meals = Meal.all 
    end

    def create
        @meal = Meal.new(meal_params)
        if @meal.save
            redirect_to admin_meals_path
        else
            redirect_to admin_meals_path
        end
    end

    def edit
        @meal = Meal.find(params[:id]) 
    end

    def update
        @meal.assign_attributes(meal_params)
        if @meal.save
            redirect_to admin_meals_path
        else
            redirect_to edit_admin_meals_path
        end
    end

    def destroy
        @meal.destroy
        redirect_to admin_meals_path
    end

    private

    def set_meal
        @meal = Meal.find(params[:id])
    end

    def meal_params
      params.require(:meal).permit(:end_time, :start_time)
    end
end