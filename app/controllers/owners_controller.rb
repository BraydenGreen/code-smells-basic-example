class OwnersController < ApplicationController
  def index
    @owners = Owner.all.sort_by{|onr| onr.first_name }
  end

  def show
    @owner = nil
    @owner = Owner.find(params[:id])
  end

  def update
    @owner = Owner.find(params[:id])

    if @owner.update(owner_params)
      flash[:success] = "Owner with name #{params[:owner][:first_name]} #{params[:owner][:last_name]} was updated successfully"
      redirect_to cats_path

    else
      flash[:error] = "Owner with name #{params[:owner][:first_neme]} #{params[:owner][:last_name]} was not created successfully"
      render :edit      
    end
  end

  def new
    @owner = Owner.new
  end

  def create
    @owner = Owner.new(owner_params)
    if @owner.save
    else
      redirect_to owners_path, success: "Owner with name #{params[:owner][:first_neme]} #{params[:owner][:last_name]} was not created successfully"
    end
  end
  
  def edit
    @owner = Owner.find_by(id: params[:id])
  end

  def destroy
    p = params[:id]
    message = nil
    success_message = ""
    error_message = ''
    @owner = Owner.find(params[:id])
    if 
      @owner.cats.each do |cat|
        cat.destroy
      end
      if @owner.destroy
        success_message = "owner destroyed" 
        flash[:success] = success_message
        redirect_to owners_path
      end
    else
      error_message = "owner not destroyed because something happened with #{params[:id]}"
      flash[:error] = error_message
      # redirect_to owners_path
    end 
  end

  # this method takes in an owner and sets its first cats age to 23
  def some_method_that_does_something(owner)
    cats = owner.cats
    cat = owner.cats.first
    cat.age = 23
    cat.save
  end

  def create_a_cat(owner, cat_name, a, cat_fur_color, ec, food_type)
    cat = Cat.new(name: cat_name, age: a, fur_color: cat_fur_color, eye_color: ec, food_type: food_type)
    if cat && cat.valid?
      owner.cats << cat
    else
      puts "cat not valid"
    end
  end

  private
    def owner_params
      if params[:owner]
        params.require(:owner).permit(:first_name, :last_name, :age, :race, :location)
      end
    end
end
