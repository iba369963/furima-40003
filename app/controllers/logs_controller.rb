class LogsController < ApplicationController

  def index
    @log = Log.new
    @furima = Furima.find(params[:furima_id])
  end

  def create

  end

end
