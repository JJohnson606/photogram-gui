class UsersController < ApplicationController
  # Action to display a list of all users
  def index 
    # Fetch all users from the database and order them by username in ascending order
    @all_users = User.all.order(username: :asc)
    
    # Render the index template from the user_templates directory
    render template: "user_templates/index"
  end

  # Action to display details of a specific user
  def show 
    # Fetch the username parameter from the URL
    my_id = params.fetch("path_id")
    # Find the user with the matching username in the database
    @user = User.where({:username => my_id}).first
     
    # Render the details template from the user_templates directory
    render({template: "user_templates/details"})
  end

  # Action to create a new user
  def create
    # Instantiate a new User object with the username parameter from the request
    @the_user = User.new(username: params[:input_username])

    # Check if the user object is valid
    if @the_user.valid?
      # Save the user to the database
      @the_user.save
      # Redirect to the newly created user's page with a success notice
      redirect_to("/users/#{@the_user.username}",{ notice: "User added successfully."})
    else
      # Redirect to the users index page with a failure notice if the user object is not valid
      redirect_to("/users",{ notice: "User failed to be added successfully."})
    end
  end

  # Action to update an existing user
  def update 
    # Fetch the user's ID from the URL
    my_id = params.fetch("path_id")
    # Find the user with the specified ID
    @the_user = User.find_by(id: my_id)
    # Update the user's username with the new value from the request
    @the_user.username = params.fetch("input_username")
   
    # Check if the user object is valid
    if @the_user.valid?
      # Save the updated user to the database
      @the_user.save
      # Redirect to the updated user's page with a success notice
      redirect_to("/users/#{@the_user.username}",{ notice: "User updated successfully."})
    else 
      # Redirect to the users index page with a failure notice if the user object is not valid
      redirect_to("/users",{ notice: "User failed to update successfully."})
    end
  end

  # Action to delete an existing user
  def destroy 
    # Fetch the user's ID from the URL
    my_id = params.fetch("path_id")
    # Find the user with the specified ID
    @user = User.find_by(id: my_id)
  
    # Delete the user from the database
    @user.destroy
    # Redirect to the users index page with a success notice
    redirect_to("/users", {:notice => "User deleted successfully."})
  end 
end
