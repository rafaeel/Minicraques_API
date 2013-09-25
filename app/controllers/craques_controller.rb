class CraquesController < ApplicationController
  # GET /craques
  # GET /craques.json
  def index
    @craques = Craque.order("name asc")

    respond_to do |format|
      format.html # index.html.erb
      format.json 
    end
  end

  # GET /craques/1
  # GET /craques/1.json
  def show
    @craque = Craque.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json 
    end
  end

  # GET /craques/new
  # GET /craques/new.json
  def new
    @craque = Craque.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @craque }
    end
  end

  # GET /craques/1/edit
  def edit
    @craque = Craque.find(params[:id])
  end

  # POST /craques
  # POST /craques.json
  def create
    @craque = Craque.new(params[:craque])

    respond_to do |format|
      if @craque.save
        format.html { redirect_to @craque, notice: 'Craque was successfully created.' }
        format.json { render json: @craque, status: :created, location: @craque }
      else
        format.html { render action: "new" }
        format.json { render json: @craque.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /craques/1
  # PUT /craques/1.json
  def update
    @craque = Craque.find(params[:id])

    respond_to do |format|
      if @craque.update_attributes(params[:craque])
        format.html { redirect_to @craque, notice: 'Craque was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @craque.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /craques/1
  # DELETE /craques/1.json
  def destroy
    @craque = Craque.find(params[:id])
    @craque.destroy

    respond_to do |format|
      format.html { redirect_to craques_url }
      format.json { head :no_content }
    end
  end
end
