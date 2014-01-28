class BlatsController < ApplicationController
  def index
    @blats = Blat.all
  end

  def show
    @blat = Blat.find(params[:id])
  end
end
