class PropertiesController < ApplicationController
  # def test
  #   puts "++++++((((((((HELLLO))))))))++++++++"
  # end
  
  def index
    @properties = Property.all
  end

  def show
    @property = Property.find(params[:id]) # SELECT * FROM properties WHERE id=1
  end

  def new
    @property = Property.new
  end

  def create
    @property = Property.create(property_params)
    if @property.save
      redirect_to(@property, notice: "Property created successfully")
    else
      puts "==================================================I'm here==============================="
      puts @property.errors.full_messages
      render turbo_stream: turbo_stream.replace("property_form", partial: "form", locals: { property: @property }), status: :unprocessable_entity
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
      render turbo_stream: turbo_stream.replace(
        "property_form", 
        partial: "form", 
        locals: { property: @property }
      ), status: :unprocessable_entity
    end
  end

  def destroy
    @property=Property.find(params[:id])
    @property.agent_id=nil
    @property.destroy
    redirect_to properties_path, notice: "Property Deleted Successfully"
  end

  def form_test
    @property=Property.new
    render :form_test
  end

  private

  def property_params
    params.require(:property).permit(:title,:address,:price,:agent_id,:image,tag_ids: [])
  end
end