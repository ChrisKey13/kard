class ListsController < ApplicationController

  before_action :set_list, only: [ :show, :edit, :update, :destroy]

  def index
    @lists = List.all
    @languages = Language.all
  end

  def show
    @flashcard = Flashcard.new
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @list.update(list_params)
      redirect_to list_path(@list), notice: 'Your list has been successfully created'
    else
      render :edit
    end
  end

  def destroy
    @list.destroy
    redirect_to root_path, notice: 'Your list was successfully destroyed'
  end

  private

  def list_params
    params.require(:list).permit(:title, :description)
  end

  def set_list
    @list = List.find(params[:id])
  end
end
