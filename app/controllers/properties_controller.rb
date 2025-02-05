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
    @property=Property.create(property_params)
    if @property.save
      redirect_to @property, notice: "Property created successfully"
    else
      render :new
    end
  end

  def edit
    @property=Property.find(params[:id])
    @tags=Tag.all
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
    @property.agent_id=nil
    @property.destroy
    redirect_to properties_path, notice: "Property Deleted Successfully"
  end

  private

  def property_params
    params.require(:property).permit(:title,:address,:price,:agent_id,tag_ids: [])
  end
end
