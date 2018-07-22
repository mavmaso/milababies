class AuPairsController < ApplicationController

  def index
    search_query = get_search_query
    if search_query
      @aupairs = AuPair.where('name LIKE ?', "%#{search_query}%")
    else
      @aupairs = AuPair.all
    end
  end

  private

    def get_search_query
      if params[:query].present?
        return params[:query]
      end
      false
    end

end