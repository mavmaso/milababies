class AuPairsController < ApplicationController
  def index
    @aupairs = if search_query
                 AuPair.where('name LIKE ?', "%#{search_query}%")
               else
                 AuPair.all
               end
  end

  private

  def search_query
    params[:query]
  end
end
