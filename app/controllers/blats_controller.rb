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
    @blat = Blat.create(blat_params)
    redirect_to @blat
  end

  private

  def blat_params
    params.require(:blat).permit(:title, :body)
  end
end
