class LawsController < ApplicationController
    
    before_action :set_law, only: [:show]

  # GET /laws
  def index
   @laws = Law.all
   render(json: @laws, include: :recipes) #relationships done for you!
  end

  
  def show
   render(json: @law, include: { recipes: { include: :comments } })
  end
  
  def create
    @law = law.new(law_params)
      if @law.save
        render json: @law, status: :created, location:        api_v1_law_url(@law)
      else
        render json: @law.errors, status: :unprocessable_entity
      end
  end
  
  
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_law
   @law = Law.find(params[:id])
  end
  # Only allow a trusted parameter “white list” through.
  def law_params
  params.permit(:name, :description)
  end
  
end
