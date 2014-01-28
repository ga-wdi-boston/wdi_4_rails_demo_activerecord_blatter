class BlatsController < ApplicationController
  def index
    @blats = if params[:show_all].present?
      Blat.all
    else
      Blat.where('updated_at > ?', 7.days.ago)
    end.order(updated_at: :desc)
  end

  def show
    @blat = Blat.find(params[:id])
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
    @blat = Blat.find(params[:id])
  end

  def update
    @blat = Blat.find(params[:id])
    @blat.assign_attributes(blat_params)

    if @blat.save
      flash[:notice] = 'Updated the blat!'
      redirect_to @blat
    else
      flash.now[:errors] = @blat.errors.full_messages
      render :edit
    end
  end

  private

  def blat_params
    params.require(:blat).permit(:title, :body)
  end
end
