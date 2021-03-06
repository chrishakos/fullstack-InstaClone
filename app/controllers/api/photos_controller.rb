class Api::PhotosController < ApplicationController

  def index

    @photos = Photo.all
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def new
  end

  def create

    @photo = Photo.new(photo_params)
    @photo.user_id = current_user.id
    @photo.username = current_user.username

    if @photo.save
      render :show
    else
      render json: @photo.errors.full_messages, status: 422
    end
  end

  def update
    @photo = Photo.find(params[:id])

    if @photo.update(photo_params)
      render :show
    else
      render json: @photo.errors.full_messages, status: 422
    end
  end

  def destroy
    @photo = Photo.find(params[:id])

    if @photo.destroy
      render :show
    else
      render json: @photo.errors.full_messages, status: 422
    end
  end

  private

  def photo_params
    params.require(:photo).permit(:user_id, :caption, :image, :username)
  end

end
