class SearchController < ApplicationController
  def index
    query = Product.ransack(params[:q])
    @results = query.result
  end
end
