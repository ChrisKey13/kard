class FlashcardsController < ApplicationController
  before_action :set_list, only: [:create, :edit]
  before_action :set_flashcard, only: [:edit, :destroy]

  def show

  end

  def create
    @flashcard = Flashcard.new(set_params)
    @flashcard.list = @list
    if @flashcard.save
      redirect_to list_path(@list)
    else
      render 'lists/show'
    end
  end

  def edit

  end

  def update
    if @flashcard.update(set_params)
      redirect_to list_flashcard_path(@flashcard)
    else
      render :edit
    end
  end

  def destroy
    @flashcard.destroy
    redirect_to list_path(@flashcard.list), notice: 'Your Flashcard Has Been Successfully Deleted'
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def set_flashcard
    @flashcard = Flashcard.find(params[:id])
  end

  def set_params
    params.require(:flashcard).permit(:title, :content, :photo, :language_id)
  end
end
