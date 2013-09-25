class FavoritosController < ApplicationController
  # GET /favoritos
  # GET /favoritos.json

# http://code4j.blogspot.com.br/2012/12/image-upload-from-ios-to-rails-part-2.html

  def index
    @favoritos = Favorito.order("name asc")


    respond_to do |format|
      format.html # index.html.erb
      # format.json { render json: @favoritos }
      format.json
    end
  end

  # GET /favoritos/1
  # GET /favoritos/1.json
  def show
    @favorito = Favorito.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      # format.json { render json: @favorito }
      format.json
    end
  end

  # GET /favoritos/new
  # GET /favoritos/new.json
  def new
    @favorito = Favorito.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @favorito }
    end
  end

  # GET /favoritos/1/edit
  def edit
    @favorito = Favorito.find(params[:id])
  end

  # POST /favoritos
  # POST /favoritos.json
  def create
    @favorito = Favorito.new(params[:favorito])

    respond_to do |format|
      if @favorito.save
        format.html { redirect_to @favorito, notice: 'Favorito was successfully created.' }
        format.json { render json: @favorito, status: :created, location: @favorito }
      else
        format.html { render action: "new" }
        format.json { render json: @favorito.errors, status: :unprocessable_entity }
      end
    end

    photo_io = @favorito.photo || @favorito.decode_photo_data
    if photo_io.present?
      upload_icon(photo_io)
    end
  end

  # PUT /favoritos/1
  # PUT /favoritos/1.json
  def update
    @favorito = Favorito.find(params[:id])

    respond_to do |format|
      if @favorito.update_attributes(params[:favorito])
        format.html { redirect_to @favorito, notice: 'Favorito was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @favorito.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /favoritos/1
  # DELETE /favoritos/1.json
  def destroy
    @favorito = Favorito.find(params[:id])
    @favorito.destroy

    respond_to do |format|
      format.html { redirect_to favoritos_url }
      format.json { head :no_content }
    end
  end

  private  
   def upload_icon(icon_image_io)           
      # upload to the exact location account id and extension
      extension = File.extname(icon_image_io.original_filename)
 
      # rails take public as root directory
      # under the root directory (public)
      # there are a icon directory
      icon_url = "/system/favoritos/photos/"+@favorito.id.to_s + extension
 
      # open in binary mode
      File.open("public"+icon_url,'wb') do |file|
        file.write(icon_image_io.read)
      end
 
      @favorito.update_attribute(:photo_url, icon_url)
   end
end
