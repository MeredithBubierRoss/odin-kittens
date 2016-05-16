class KittensController < ApplicationController
  def index
    @kittens = Kitten.all
    @kittens.as_json
  end

  def show
    @kitten = Kitten.find(params[:id])
  end

  def new
    @kitten = Kitten.new
  end

  def create
    @kitten = Kitten.new(kitten_params)
    if @kitten.save
      flash[:success] = "Cuteness saved!"
      redirect_to kittens_path
    else
      flash.now[:error] = @kitten.errors.full_messages.join(", ")
      render :new
    end
  end

  def edit
    @kitten = Kitten.find(params[:id])
  end

  def update
    @kitten = Kitten.find(params[:id])
    if @kitten.update_attributes(kitten_params)
      flash[:success] = "All that cute, updated!"
      redirect_to kitten_path
    else
      flash.now[:error] = "Cute update fail"
      render :edit
    end
  end

  def destroy
    @kitten = Kitten.find(params[:id])
    @kitten.destroy
    redirect_to kittens_path
  end

  private

  def kitten_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end
end
