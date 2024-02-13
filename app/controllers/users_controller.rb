class UsersController < ApplicationController
#user
 #Id	Username	Private	Likes count	Comments count	Created at	Updated at

 #follow request 
 #Id,	Sender,	Recipient,	Status,	Created at,	Updated at,

def index 
   @all_users = User.all.order({:username => :asc})
   render({:template => "user_templates/index"})
end

def show 
  render({:template => "user_templates/details"})
end

def create
  @the_user = User.new
  @the_user.username = params.fetch("input_username")

  if @the_user.valid?
    @the_user.save
    redirect_to("/user", { :notice => "User added successfully." })
  else
    redirect_to("/user", { :notice => "Actor failed to update successfully." }) 
  end
end


def update 
  my_id = params.fetch("path_id")
  @the_user = User.where(:id => my_id)
  @the_user.user_name = params.fetch("input_username")

  @the_user.save
  redirect_to("/user", {:notice => "Username updated successfully."})
end

def destroy
end


=begin
 def index
  @list_of_actors = Actor.all.order({ :created_at => :desc })

  render({ :template => "actor_templates/index" })
end

def show
  the_id = params.fetch("path_id")
  @the_user = Actor.where({:id => the_id }).at(0)
  
  render({ :template => "actor_templates/show" })
end

def create
  @the_actor = Actor.new
  @the_actor.name = params.fetch("query_name")
  @the_actor.dob = params.fetch("query_dob")
  @the_actor.bio = params.fetch("query_bio")
  @the_actor.image = params.fetch("query_image")

  if @the_actor.valid?
    @the_actor.save
    redirect_to("/actors", { :notice => "Actor created successfully." })
  else
    redirect_to("/actors", { :notice => "Actor failed to create successfully." })
  end
end

def update
  the_id = params.fetch("path_id")
  @the_actor = Actor.where({ :id => the_id }).at(0)

  @the_actor.name = params.fetch("query_name")
  @the_actor.dob = params.fetch("query_dob")
  @the_actor.bio = params.fetch("query_bio")
  @the_actor.image = params.fetch("query_image")

  if @the_actor.valid?
    @the_actor.save
    redirect_to("/actors/#{@the_actor.id}", { :notice => "Actor updated successfully."} )
  else
    redirect_to("/actors/#{@the_actor.id}", { :alert => "Actor failed to update successfully." })
  end
end

def destroy
  the_id = params.fetch("path_id")
  @the_actor = Actor.where({ :id => the_id }).at(0)

  @the_actor.destroy

  redirect_to("/actors", { :notice => "Actor deleted successfully."} )
end
end
=end
end
