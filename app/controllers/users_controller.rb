class UsersController < ApplicationController
  before_action :find_work, except: %i[index new create]

  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  def login_form
    @user = User.new
  end

  def login
    name = params[:user][:name]

    user = User.find_by(name: name)
    user ||= User.create(user_params)
    session[:user_id] = user.id

    flash[:status] = :success
    flash[:message] = "Sucessfully logged in as user #{user.name}"
    redirect_to home_path
  end

  def logout
    session[:user_id] = nil
    flash[:status] = :success
    flash[:message] = 'You are now logged out.'
    redirect_to logout_path
  end

  def
  def(_current)
    @user = User.find_by(id: session[:user_id])
    unless @user
      flash[:message] = 'You need to login to see this page.'
      redirect_to login_path
      return
    end
  end
  end
