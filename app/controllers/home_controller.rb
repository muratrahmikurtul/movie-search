class HomeController < ApplicationController
  def search
    @param = params[:q]
    redirect_to "/index?name=#{@param}"
  end

  def index
    service = OmdbService.new
    @movies = service.call_service(params[:name])
    if @movies.blank? && params[:name].present?
      flash[:error] = "There is no movie with this name"
    else
      flash.clear
    end
  end
end
