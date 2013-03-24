class WeatherBoxesController < ApplicationController
  # GET /weather_boxes
  # GET /weather_boxes.xml
  def index
    @weather_boxes = WeatherBox.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @weather_boxes }
    end
  end

  # GET /weather_boxes/1
  # GET /weather_boxes/1.xml
  def show
    @weather_box = WeatherBox.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @weather_box }
    end
  end

  # GET /weather_boxes/new
  # GET /weather_boxes/new.xml
  def new
    @weather_box = WeatherBox.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @weather_box }
    end
  end

  # GET /weather_boxes/1/edit
  def edit
    @weather_box = WeatherBox.find(params[:id])
  end

  # POST /weather_boxes
  # POST /weather_boxes.xml
  def create
    @weather_box = WeatherBox.new(params[:weather_box])

    respond_to do |format|
      if @weather_box.save
        flash[:notice] = 'WeatherBox was successfully created.'
        format.html { redirect_to(@weather_box) }
        format.xml  { render :xml => @weather_box, :status => :created, :location => @weather_box }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @weather_box.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /weather_boxes/1
  # PUT /weather_boxes/1.xml
  def update
    @weather_box = WeatherBox.find(params[:id])

    respond_to do |format|
      if @weather_box.update_attributes(params[:weather_box])
        flash[:notice] = 'WeatherBox was successfully updated.'
        format.html { redirect_to(@weather_box) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @weather_box.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /weather_boxes/1
  # DELETE /weather_boxes/1.xml
  def destroy
    @weather_box = WeatherBox.find(params[:id])
    @weather_box.destroy

    respond_to do |format|
      format.html { redirect_to(weather_boxes_url) }
      format.xml  { head :ok }
    end
  end
end
