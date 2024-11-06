# frozen_string_literal: true

# Bookmarks managment
class BookmarksController < ApplicationController
  layout 'bookmarks'
  before_action :find_bookmark_by_id, only: %i[edit update destroy]
  before_action :authenticate_user!
  def index
    @bookmarks = Bookmark.all
  end

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    if @bookmark.save
      redirect_to bookmarks_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @bookmark.update(bookmark_params)
      redirect_to bookmarks_path
    else
      render :edit
    end
  end

  def destroy
    @bookmark.destroy
    redirect_to bookmarks_path
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:title, :url_link, :description)
  end

  def find_bookmark_by_id
    @bookmark = Bookmark.find(params[:id])
  end
end
