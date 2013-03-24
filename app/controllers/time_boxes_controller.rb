class TimeBoxesController < ApplicationController
  # GET /time_boxes
  # GET /time_boxes.xml
  def index
    @time_boxes = TimeBox.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @time_boxes }
    end
  end

  # GET /time_boxes/1
  # GET /time_boxes/1.xml
  def show
    @time_box = TimeBox.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @time_box }
    end
  end

  # GET /time_boxes/new
  # GET /time_boxes/new.xml
  def new
    @time_box = TimeBox.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @time_box }
    end
  end

  # GET /time_boxes/1/edit
  def edit
    @time_box = TimeBox.find(params[:id])
  end

  # POST /time_boxes
  # POST /time_boxes.xml
  def create
    @time_box = TimeBox.new(params[:time_box])

    respond_to do |format|
      if @time_box.save
        flash[:notice] = 'TimeBox was successfully created.'
        format.html { redirect_to(@time_box) }
        format.xml  { render :xml => @time_box, :status => :created, :location => @time_box }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @time_box.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /time_boxes/1
  # PUT /time_boxes/1.xml
  def update
    @time_box = TimeBox.find(params[:id])

    respond_to do |format|
      if @time_box.update_attributes(params[:time_box])
        flash[:notice] = 'TimeBox was successfully updated.'
        format.html { redirect_to(@time_box) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @time_box.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /time_boxes/1
  # DELETE /time_boxes/1.xml
  def destroy
    @time_box = TimeBox.find(params[:id])
    @time_box.destroy

    respond_to do |format|
      format.html { redirect_to(time_boxes_url) }
      format.xml  { head :ok }
    end
  end
end
