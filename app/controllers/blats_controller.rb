class BlatsController < ApplicationController
  def index
    @blats = if params[:show_all].present?
      Blat.all
    else
      Blat.where('updated_at > ?', 7.days.ago)
    end
  end

  def show
    @blat = Blat.find(params[:id])
  end
end
