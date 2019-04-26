class WorksController < ApplicationController
  
  def index
    @albums = Work.where(category: "album")
    @movies = Work.where(category: "movie")
    @books = Work.where(category: "book")

  end

  def def new
    @work = Work.new
  end

  def show
    @work = Work.find_by(id: params[:id])
  end



end

private 
def work_params
  return params.require(:work).permit(:category, :title, :publication_year, :description, :creator)
end