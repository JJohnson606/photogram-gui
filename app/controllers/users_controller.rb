=begin
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
    redirect_to("/user/#{@the_user.username}", { :notice => "User added successfully." })
  else
    redirect_to("/user", { :notice => "User failed to update successfully." }) 
  end
end


def update 
  my_id = params.fetch("path_id")
  @the_user = User.find(my_id)
  #@the_user.find(my_id)
  @the_user.username = params.fetch("input_username")
   
  if @the_user.valid?
   @the_user.save
  redirect_to("/user/#{@the_user.username}", {:notice => "Username updated successfully."})
  else 
    redirect_to("/user/", {:notice => "Username failed to update successfully."})
  end
end


end
=end

class UsersController < ApplicationController
  # User
  # Id Username Private Likes count Comments count Created at Updated at

  # Follow request
  # Id, Sender, Recipient, Status, Created at, Updated at

  def index 
    @all_users = User.all.order(username: :asc)
    render template: "user_templates/index"
  end

  def show 
    render template: "user_templates/details"
  end

  def create
    @the_user = User.new(username: params[:input_username])

    if @the_user.save
      redirect_to user_path(@the_user.username), notice: "User added successfully."
    else
      redirect_to "/user", notice: "User failed to update successfully."
    end
  end

  def update 
    @the_user = User.find(params[:path_id])
    @the_user.username = params[:input_username]
   
    if @the_user.valid?
      @the_user.save
      redirect_to user_path(@the_user.username), notice: "Username updated successfully."
    else 
      redirect_to user_path(@the_user.username), notice: "Username failed to update successfully."
    end
  end
end
