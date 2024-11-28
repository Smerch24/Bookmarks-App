# frozen_string_literal: true

# Labels managment
class LabelsController < ApplicationController
  layout 'bookmarks'
  before_action :find_label_id, only: %i[show update destroy]

  def show
    @labels = Label.by_user(current_user.id).order_by_name
    @bookmarks = Bookmark.by_user(current_user.id).by_label(@label.id)
  end

  def create
    @label = Label.new(label_params)
    if @label.save
      redirect_to bookmarks_path
    else
      @bookmarks = Bookmark.by_user(current_user.id)
      @labels = Label.by_user(current_user.id)
      render 'bookmarks/index'
    end
  end

  def update
    if @label.update(label_params)
      redirect_to bookmarks_path
    else
      render 'bookmarks/index'
    end
  end

  def destroy
    @label.destroy
    redirect_to bookmarks_path
  end

   private

  def label_params
    params.require(:label).permit(:name, :user_id)
  end

  def find_label_id
    @label = Label.find(params[:id])
  end
end
