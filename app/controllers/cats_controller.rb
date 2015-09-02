class CatsController < ApplicationController
  def index
    @cats = []
    Cats.each do |cat|
      cats << cat
  end

  def show
    @cat = Cat.find(params[:id])
  end

  def edit
    x = params[:id]
    @cat = Cat.where(id: x)
  end

  def update
    @cat = Cat.find(params[:id])

    if @cat.update(cat_params)
      flash[:success] = "cat with id: #{params[:id]} updated"
      redirect_to cats_path
    else
      flash[:error] = "cat with id: #{params[:id]} not updated"
      reder :edit
    end
  end

  def new_cat
    @cat = Cat.new
  end

  def destory
    cat_id = params[:id]
    @cat = Cat.find(params[:id])
    
      if @cat.destroy
        flash[:success] = "cat destroyed"
      end
   
  end

  def create
    @cat = Cat.new(cat_params)
    if @cat && @cat.save
      success_message = "cat was successfully saved."
      flash[:success] = success_message
      redirect_to cats_path
    else
      error_message = "cat was not succesfully saved."
      flash[:error] = error_message
      render "new"
    end
  end

  private
    def cat_params
      params.require(:cats).permit(:name, :age, :fur_color, :eye_color, :food_types)
    end
end
