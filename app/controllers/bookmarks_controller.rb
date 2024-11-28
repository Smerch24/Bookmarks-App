# frozen_string_literal: true

# Bookmarks managment
class BookmarksController < ApplicationController
  layout 'bookmarks'
  before_action :find_bookmark_by_id, only: %i[update destroy]
  before_action :authenticate_user!

  def index
    @bookmarks = Bookmark.by_user(current_user.id)
    @bookmark = Bookmark.new
    @labels = Label.by_user(current_user.id).order_by_name
    @label = Label.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.user_id = current_user.id
    if @bookmark.save
      redirect_to bookmarks_path
    else
      render :new
    end
  end

  def update
    if @bookmark.update(bookmark_params)
      redirect_to bookmarks_path
    else
      render 'bookmarks/index'
    end
  end

  def destroy
    @bookmark.destroy
    redirect_to bookmarks_path
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:title, :url_link, :description, :user_id, :screenshot, :label_id)
  end

  def find_bookmark_by_id
    @bookmark = Bookmark.find(params[:id])
  end
end
