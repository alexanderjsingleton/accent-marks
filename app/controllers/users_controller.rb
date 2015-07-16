class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to root_url, :notice => "Signed up!"
    else
      render "new"
    end
  end

  def login
    render partial: 'login'
  end

  
  def logout
    @user = User.find_by(id: session[:user_id])
    if @user != nil
      session.delete(:user_id)
      puts "Session deleted"
    end
    redirect_to :root
    end
  end
