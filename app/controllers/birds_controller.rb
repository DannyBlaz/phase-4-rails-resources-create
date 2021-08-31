class BirdsController < ApplicationController

  # GET /birds
  def index
    birds = Bird.all
    render json: birds
  end

  # GET /birds/:id
  def show
    bird = Bird.find_by(id: params[:id])
    if bird
      render json: bird
    else
      render json: { error: "Bird not found" }, status: :not_found
    end
  end

  # POST /birds
  def create
    bird = Bird.new(bird_params)
        if bird.save
            redirect_to birds_url
        else
            render json: { error: "unsuccessfull" }, status: :not_found
        end
  end

  def  bird_params
        params.require(:bird).permit(:name, :species)
    end

end