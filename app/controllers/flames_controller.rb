class FlamesController < ApplicationController

    def index
        @flames = Flame.all
    end

    def show
        @flames = Flame.find(params[:id])
    end

    def new
        @flames = Flame.new()
    end

    def create
        @flames = Flame.new(flame_params)

        if @flames.save()
            redirect_to :action => "index"
        end
    end

    private

    def flame_params
        params.require(:flame).permit(:yourname, :crushname, :result)
    end
end
