class OwnersController < ApplicationController
  def index
    @owners = Owner.all
  end

  def show
    @owner = nil
    @owner = Owner.find(params[:id])
  end

  def update
    @owner = Owner.find(params[:id])

    if @owner.update(owner_params)
      flash[:success] = "Owner with name #{params[:owner][:first_name]} #{params[:owner][:last_name]} was updated successfully"
      redirect_to owners_path

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
      redirect_to owners_path
    else
      render :new
    end
  end
  
  def edit
    @owner = Owner.find_by(id: params[:id])
  end

  def destroy
    @owner = Owner.find(params[:id])
      if @owner.destroy
        success_message = "owner destroyed" 
        flash[:success] = success_message
        redirect_to owners_path
    
    else
      error_message = "owner not destroyed because something happened with #{params[:id]}"
      flash[:error] = error_message
       redirect_to owners_path
    end 
  end
  


  private
    def owner_params
      if params[:owner]
        params.require(:owner).permit(:first_name, :last_name, :age, :race, :location)
      end
    end
end
