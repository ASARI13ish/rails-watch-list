class BookmarksController < ApplicationController
  before_action :set_list, only: %i[new create]

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list), notice: 'Bookmark was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@bookmark.list)
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end

# class BookmarksController < ApplicationController
#   # before_action :set_bookmark, only: %i[new create]

#   def new
#     @bookmark = Bookmark.new()
#   end

#   def create
#     @list = List.find(params[:list_id])
#     @bookmark = Bookmark.new(bookmark_params)
#     @list.bookmark = @bookmark
#     if @bookmark.save
#       redirect_to bookmark_path(@bookmark), notice: 'Bookmark was successfully created.'
#     else
#       render :new, status: :unprocessable_entity
#     end
#   end

#   private

#   def bookmark_params
#     params.require(:bookmark).permit(:comment)
#   end
# end
