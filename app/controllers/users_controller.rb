class UsersController < ApplicationController
  #   before_action :find_work, except: %i[index new create]

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

    if user
      # user ||= User.create(user_params)
      session[:user_id] = user.id

      flash[:status] = :success
      flash[:message] = "Sucessfully logged in as user #{user.name}"
      redirect_to home_path
    end
  end

  def logout
    session[:user_id] = nil
    flash[:status] = :success
    flash[:message] = 'You are now logged out.'
    redirect_to logout_path
  end

  def upvote
    user = User.find_by(id: session[:user_id])
    if user
      @work = Work.find_by(id: params[:id])
      if user.voted_for? @work
        flash[:status] = :error
        flash[:message] = 'You may not vote for the same media twice.'
        redirect_to work_path
      else
        if @work.upvote_by user
          flash[:status] = :success
          flash[:message] = 'Successfully upvoted!'
          redirect_to work_path(@work.id)
        end
      end
    else
      flash[:status] = :error
      flash[:message] = 'You must be logged in to vote.'
      redirect_to work_path
    end
  end
end
