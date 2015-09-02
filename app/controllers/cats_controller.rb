class CatsController < ApplicationController
  #belongs_to :owner

  def index
    @cats = []
    Cats.each do |cat|
      @cats << cat
    end
  end

  def show
    @cat = Cat.find(params[:id])
  end

  def edit
    @cat = Cat.find(params[:id]) 
  end

  def update
    @cat = Cat.find(params[:id])

    if @cat.update(cat_params)
      flash[:success] = "cat with id: #{params[:id]} updated"
      redirect_to owners_path
    else
      flash[:error] = "cat with id: #{params[:id]} not updated"
      render :edit
    end
  end

  def new
    @cat = Cat.new
  end

  def destory
    @cat = Cat.find(params[:id])
    
      if @cat.destroy
        flash[:error] = "#{params[:cat][:name]} was deleted."
        redirect_to owners_path
      else
        flash[:error] = "#{params[:cat][:name]} could not be deleted."
      end
   
  end

  def create
    @cat = Cat.new(cat_params)
    if @cat && @cat.save
      success_message = "cat was successfully saved."
      flash[:success] = success_message
      redirect_to owners_path
    else
      error_message = "cat was not succesfully saved."
      flash[:error] = error_message
      render :new
    end
  end

  private
    
    def cat_params
     if params[:cat]
      params.require(:cat).permit(:name, :age, :fur_color, :eye_color, :food_type)
    end
    end
end
