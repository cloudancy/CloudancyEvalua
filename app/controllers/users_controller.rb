class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    authorize! :index, @user, :message => t(:notanadmin)
    @users = User.all
  end

  def create
    authorize! :update, @user, :message => t(:notanadmin)
    @user = User.new(params[:user])
    if @user.save
      redirect_to users_path, :notice => t(:userupdated)
    else
      #format.html { render action: "new" }
      redirect_to users_path, :alert => t(:unabletoupdateuser)
    end

  end


  def new
    @user = User.new    
  end

  def show
    authorize! :read, @user, :message => t(:notanadmin)
    @user = User.find(params[:id])
  end

  def edit
    authorize! :read, @user, :message => t(:notanadmin)
    @user = User.find(params[:id])
  end
  
  def update
    authorize! :update, @user, :message => t(:notanadmin)
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user], :as => :admin)
      redirect_to users_path, :notice => t(:userupdated)
    else
      redirect_to users_path, :alert => t(:unabletoupdateuser)
    end
  end
    
  def destroy
    authorize! :destroy, @user, :message => t(:notanadmin)
    user = User.find(params[:id])
    unless user == current_user
      user.destroy
      redirect_to users_path, :notice => t(:userdeleted)
    else
      redirect_to users_path, :notice => t(:candeleteyourself)
    end
  end
end
