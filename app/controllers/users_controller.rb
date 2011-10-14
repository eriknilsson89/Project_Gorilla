class UsersController < ApplicationController
  before_filter :authenticate, :only => [:edit, :update, :index, :destroy]
  before_filter :correct_user, :only => [:edit, :update]
  before_filter :admin_user,   :only => [:destroy, :index]
  before_filter :signedin_user,:only => [:new, :create]    
  def new
    @user = User.new
    @title = "Registrering"
  end  

  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Registreringen lyckades!"
      redirect_to @user
    else
      @title = "Registrering"
      render 'new'
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Uppgifter uppdaterade"
      redirect_to @user
    else
      @title = "Uppdatera uppgifter"
      render 'edit'
    end
  end

  def edit
    @title = "Uppdatera uppgifter"
  end

  def destroy
    user = User.find(params[:id])
    if !user.admin?
      user.destroy
      flash[:success] = "User destroyed."
    else
      flash[:error] = "You can't remove another admin"
    end
    redirect_to users_path
  end
  def index
    @title = "All users"
    @users = User.paginate(:page => params[:page])
  end

  def show
    @user = User.find(params[:id])
    @title = @user.name
  end
  private

    def authenticate
      deny_access unless signed_in?
    end
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
    def signedin_user
      redirect_to(root_path) unless !signed_in?
    end
end
