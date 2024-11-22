# frozen_string_literal: true

# Labels managment
class LabelsController < ApplicationController
  layout 'bookmarks'

  def show
    @label = Label.find(params[:id])
    @bookmarks = Bookmark.where(label_id: @label.id, user_id: current_user.id)
  end

  def create
    @label = Label.new(label_params)
    if @label.save
      redirect_to bookmarks_path
    else
      @bookmarks = Bookmark.where(user: current_user)
      @labels = Label.all
      render 'bookmarks/index'
    end
  end

  def update
    @label = Label.find(params[:id])
    if @label.update(label_params)
      redirect_to bookmarks_path
    else
      render 'bookmarks/index'
    end
  end

  def destroy
    @label = Label.find(params[:id])
    @label.destroy
    redirect_to bookmarks_path
  end

   private

  def label_params
    params.require(:label).permit(:name, :user_id)
  end
end
