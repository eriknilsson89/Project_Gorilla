class SessionsController < ApplicationController
  
  def new
    @title = "Logga in"
  end
  
  def create
    user = User.authenticate(params[:session][:email],
                             params[:session][:password])
    if user.nil?
      flash.now[:error] = "Felaktiga uppgfiter. Testa igen!"
      @title = "Logga in"
      render 'new'
    else
      if params[:remember_me]
        create_cookies user
      end
      sign_in user
      redirect_back_or user
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end
end
