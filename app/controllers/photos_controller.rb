class PhotosController < ApplicationController

def index

  @photos = Photo.all.order({:created_at => :desc})
  render({:template => "photos_templates/index"})
end

def show
  my_id = params.fetch("path_id")
  @photo = Photo.find_by(id: my_id)
  comments = Comment.where({:photo_id => my_id})

  @old_comments = comments.order(created_at: :desc)

  
  if @photo
    render({:template => "photos_templates/details"})
  else
    render({:template => "photos_templates/index"})
  end
end


def create
  @photo = Photo.new
  @photo.caption = params.fetch("input_caption")
  @photo.image = params.fetch("input_image")
  @photo.owner_id = params.fetch("input_owner_id")

  if @photo.valid?
    @photo.save
    redirect_to("/photos/#{@photo.id}", {:notice => "Photo created successfully."})
  else
    redirect_to("/photos", {:notice => "Photo failed to create successfully."})
  end
end

def create_comment
  @comment = Comment.new
  @comment.body = params.fetch("input_comment")
  @comment.photo_id = params.fetch("input_photo_id")
  @comment.author_id = params.fetch("input_author_id")

  if @comment.valid?
    @comment.save
    redirect_to("/photos/#{@comment.photo_id}", {:notice => "Comment created successfully."})
  else
    redirect_to("/photos", {:notice => "Comment failed to create successfully."})
  end
end

def update
  my_id = params.fetch("path_id")
  @photo = Photo.find(my_id)
  @photo.caption = params.fetch("input_caption")
  @photo.image = params.fetch("input_image")
  
  if @photo.valid?
    @photo.save
    redirect_to("/photos/#{@photo.id}", {:notice => "Photo updated successfully."})
  else
    redirect_to("/photos", {:notice => "Photo failed to update successfully."})
  end
end

def destroy
  my_id = params.fetch("path_id")
  @photo = Photo.find_by(id: my_id)
  
  @photo.destroy
  redirect_to("/photos", {:notice => "Photo deleted successfully."})
end
end
