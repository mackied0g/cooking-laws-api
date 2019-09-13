class LawsController < ApplicationController
    
    before_action :set_law, only: [:show, :update, :destroy]

  # GET /laws
  def index
   @laws = Law.all
   render(json: @laws, include: :recipes) #relationships done for you!
  end

  
  def show
   render(json: @law, include: { recipes: { include: :comments } })
  end
  
  def create
    @law = Law.new(law_params)
      if @law.save
        render(json: @law)
      else
        render(json: @law.errors, status: :unprocessable_entity)
      end
  end
  
  def destroy
    @law.destroy
    render json: {message: "Item deleted."}
  end
  
  def update
    if @law.update(law_params)
        render json: @law
    else
        render json: @law.errors, status: :unprocessable_entity
    end
    end
  
  private

  def set_law
   @law = Law.find(params[:id])
  end
  
  def law_params
  params.permit(:name, :description)
  end
  
end
