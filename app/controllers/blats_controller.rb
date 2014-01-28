class BlatsController < ApplicationController
  def index
    @blats = Blat.all
  end
end
