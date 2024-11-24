# frozen_string_literal: true

# Bookmarks managment
class BookmarksController < ApplicationController
  layout 'bookmarks'
  before_action :find_bookmark_by_id, only: %i[update destroy]
  before_action :authenticate_user!
  def index
    @bookmarks = Bookmark.where(user_id: current_user.id)
    @bookmark = Bookmark.new
    @labels = Label.where(user_id: current_user.id).sort_by { |label| -label.name.length }
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
    @bookmark = Bookmark.find(params[:id])
    if @bookmark.update(bookmark_params)
      Rails.logger.info "Update successful: #{@bookmark.attributes}"
      redirect_to bookmarks_path, notice: 'Bookmark updated successfully.'
    else
      Rails.logger.info "Update failed: #{@bookmark.errors.full_messages}"
      render :edit, status: :unprocessable_entity
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
