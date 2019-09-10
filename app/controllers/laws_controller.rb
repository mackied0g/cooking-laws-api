class LawsController < ApplicationController
    
    before_action :set_law, only: [:show]

  # GET /laws
  def index
   @laws = Law.all
   render(json: @laws, include: :recipes) #relationships done for you!
  end

  
  def show
   render(json: @law, include: :recipes)
  end
  
  
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_law
   @law = Law.find(params[:id])
  end
  # Only allow a trusted parameter “white list” through.
  def law_params
  params.require(:law).permit(:name, :description)
  end
  
end
