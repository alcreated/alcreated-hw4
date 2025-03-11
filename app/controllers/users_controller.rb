class UsersController < ApplicationController
  def new
  end

  def show
    @user = User.find_by({ "id" => params["id"] })
  end


  def create
    @user = User.new
    @user["username"] = params["name"]
    @user["email"] = params["email"]
    # encrypt user's password before storing in database
    @user["password"] = BCrypt::Password.create(params["password"])
    @user.save
    redirect_to "/login"
  end
end