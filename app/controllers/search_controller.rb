class SearchController < ApplicationController
  def index
    query = Product.ransack(name_cont: params[:q])
    @results = query.result
    respond_to do |format|
      format.turbo_stream
      format.html
    end
  end
end
