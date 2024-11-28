# frozen_string_literal: true

# Labels managment
class LabelsController < ApplicationController
  layout 'bookmarks'
  before_action :find_label_id, only: %i[show update destroy]

  def show
    @labels = Label.current_user.order_by_name
    @bookmarks = Bookmark.current_user.current_label
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
