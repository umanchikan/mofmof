class PropertiesController < ApplicationController
  before_action :set_property, only: [:show, :edit, :update, :destroy]

  # GET /properties
  # GET /properties.json
  def index
    @properties = Property.all
  end

  # GET /properties/1
  # GET /properties/1.json
  def show
    @near_stations = @property.near_stations
  end

  # GET /properties/new
  def new
    @property = Property.new
    @property.near_stations.build
  end

  # GET /properties/1/edit
  def edit
    @near_stations = @property.near_stations
  end

  # POST /properties
  # POST /properties.json
  def create
    @property = Property.new(property_params)
    if @property.save
      redirect_to property_path(@property), notice: 'Property was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /properties/1
  # PATCH/PUT /properties/1.json
  def update
    if @property.update(property_params)
      redirect_to @property, notice: 'Property was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /properties/1
  # DELETE /properties/1.json
  def destroy
    @property.destroy
    redirect_to properties_url, notice: 'Property was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_property
      @property = Property.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def property_params
      params.require(:property).permit(
          :name,
          :price,
          :address,
          :age,
          :remark,
          near_stations_attributes: [:line_name,
                        :station_name,
                        :minutes,
                        :id]
                                        )
    end
end
