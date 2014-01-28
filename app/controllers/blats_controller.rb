class BlatsController < ApplicationController
  before_action :find_blat, only: [:show, :edit, :update, :destroy]

  def index
    @blats = if params[:show_all].present?
      Blat.all
    else
      Blat.where('updated_at > ?', 7.days.ago)
    end.order(updated_at: :desc)
  end

  def show
  end

  def new
    @blat = Blat.new
  end

  def create
    @blat = Blat.new(blat_params)

    if @blat.save
      # Using flash[] because we want it to appear on the *next* request
      flash[:notice] = 'Created a new blat!'
      redirect_to @blat
    else
      # Using flash.now[] because we want it to appear on *this* request
      flash.now[:errors] = @blat.errors.full_messages
      render :new
    end
  end

  def edit
  end

  def update
    @blat.assign_attributes(blat_params)

    if @blat.save
      flash[:notice] = 'Updated the blat!'
      redirect_to @blat
    else
      flash.now[:errors] = @blat.errors.full_messages
      render :edit
    end
  end

  def destroy
    if @blat.destroy
      flash[:notice] = 'Deleted the blat!'
      redirect_to action: :index
    else
      # Assume whatever prevented the destroy added an error message for us
      flash.now[:errors] = @blat.errors.full_messages
      redirect_to :back
    end
  end

  private

  def find_blat
    @blat = Blat.find(params[:id])
  end

  def blat_params
    params.require(:blat).permit(:title, :body)
  end
end
