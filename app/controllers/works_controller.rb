class WorksController < ApplicationController
  
  def index
    @albums = Work.where(category: "album")
    @movies = Work.where(category: "movie")
    @books = Work.where(category: "book")

  end

  def show
    @work = Work.find_by(id: params[:id])
  end

  def new
    @work = Work.new
  end

  def create
    @work = Work.new(work_params)
    @work.save 
    redirect_to work_path(@work.id)
  end

private 

  def work_params
    return params.require(:work).permit(:category, :title, :publication_year, :description, :creator)
  end

end