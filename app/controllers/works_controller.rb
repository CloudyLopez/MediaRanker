class WorksController < ApplicationController
  
  def index
    @works = Work.all
    @movies = movies
    puts @movies
  end

  def movies
    Work.where(category: "movie")
  end

end