class SearchController < ApplicationController

  def index
    # require 'pry'; binding.pry
    render locals: {
      facade: HogwartsFacade.new(params[:house])
    }
  end

end
