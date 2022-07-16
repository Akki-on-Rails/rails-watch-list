class BookmarksController < ApplicationController
  before_action :find_list

  def new
    @bookmark = Bookmark.new
  end

  def create
    # here we have to grab params from our form and add the movie_id to our bookmark
    # @movie = Movie.find(params[:list][:movie]) --> raise to find out where to find all data needed
    @bookmark = Bookmark.new(list: @list, movie: @movie)
    # @bookmark.list = @list
    @bookmark.save
    redirect_to list_path(@list)
  end

  private

  def find_list
    @list = List.find(params[:list_id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment)
  end
end
