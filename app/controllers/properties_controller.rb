class PropertiesController < ApplicationController
  def index
    @properties=Property.all
  end

  def show
    @property=Property.find(params[:id])
  end

  def new
    @property=Property.new
  end

  def create
      render :new
  end

  def edit
    @property=Property.find(params[:id])
  end

  def update
    @property=Property.find(params[:id])
    if @property.update(property_params)
      redirect_to @property, notice: "Property updated Successfully"
    else  
      render :edit
    end
  end

  def destroy
    @property=Property.find(params[:id])
    @property.destroy
    redirect_to properties_path, notice: "Property Deleted Successfully"
  end

  private

  def property_params
    params.require(:property).permit(:title,:address,:price,:agent_id)
  end
end
