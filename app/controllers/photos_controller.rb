class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :edit, :update, :destroy]

  # GET /photos
  # GET /photos.json
  def index
    @photos = Photo.all
  end

  # GET /photos/1
  # GET /photos/1.json
  def show
  end

  # GET /photos/new
  def new
    @photo = Photo.new
  end

  # GET /photos/1/edit
  def edit
  end

  # POST /photos
  # POST /photos.json
  def create
    @photo = Photo.new(photo_params)

    respond_to do |format|
      if @photo.save
        format.html { redirect_to @photo, notice: t(:created, model: 'Photo') }
        format.json { render :show, status: :created, location: @photo }
      else
        format.html { render :new }

        format.json do
          render json: @photo.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # PATCH/PUT /photos/1
  # PATCH/PUT /photos/1.json
  def update
    respond_to do |format|
      if @photo.update(photo_params)
        format.html { redirect_to @photo, notice: t(:updated, model: 'Photo') }
        format.json { render :show, status: :ok, location: @photo }
      else
        format.html { render :edit }

        format.json do
          render json: @photo.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    @photo.destroy
    respond_to do |format|
      format.html do
        redirect_to photos_url, notice: t(:destroyed, model: 'Photo')
      end

      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo
      @photo = Photo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the
    # white list through.
    def photo_params
      p = params.require(:photo).permit(:title, :image)
      p[:bytes] = p[:image].size if p[:image]
      p
    end
end
