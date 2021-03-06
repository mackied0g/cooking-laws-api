class FavoritesController < ApplicationController
        before_action :set_favorite, only: [:show, :create, :update, :destroy]

    # GET /favorites
    def index
        @favorites = Favorite.all
        render(json: @favorites)
    end

    # GET /favorites/1
    def show
         render(json: @favorite)
    end
    
    # POST /favorites
    def create
      @favorite = Favorite.new(favorite_params)
        if @favorite.save
          render json: @favorite, status: :created, location:        api_v1_favorite_url(@favorite)
        else
          render json: @favorite.errors, status: :unprocessable_entity
        end
    end
    
    # PATCH/PUT /favorites/1
    def update
    if @favorite.update(favorite_params)
        render json: @favorite
    else
        render json: @favorite.errors, status: :unprocessable_entity
    end
    end
    
    # DELETE /favorites/1
    def destroy
        @favorite.destroy
    end
    
    
    private
    # Use callbacks to share common setup or constraints between actions.
    def set_favorite
        @favorite = favorite.find(params[:id])
    end
    
    # Only allow a trusted parameter “white list” through.
    def favorite_params
     params.require(:favorite).permit(:user_id. :law_id)
    end

end
