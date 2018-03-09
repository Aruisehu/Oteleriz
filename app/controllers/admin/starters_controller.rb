class Admin::StartersController < Admin::BaseController
    before_action :set_starter, only: [:edit, :update, :show, :destroy]
    def new
        @starter = Starter.new
    end

    def index
        @starters = Starter.all 
    end

    def create
        @starter = Starter.new(starter_params)
        if @starter.save
            redirect_to admin_starters_path
        else
            redirect_to admin_starters_path
        end
    end

    def edit
        @starter = Starter.find(params[:id]) 
    end

    def update
        @starter.assign_attributes(starter_params)
        if @starter.save
            redirect_to admin_starters_path
        else
            redirect_to edit_admin_starters_path
        end
    end

    def destroy
        @starter.destroy
        redirect_to admin_starters_path
    end

    private

    def set_starter
        @starter = Starter.find(params[:id])
    end

    def starter_params
      params.require(:starter).permit(:name_translations, :description_translations, :ask_roasting, :price, :img_url)
    end
end