class PhotosController < ApplicationController

def index
  @photos = Photo.all
  render({:template => "photos_templates/index"})
end

def show
end

def create
end

def create_comment
end

def update
end

def destroy
end
  





end
