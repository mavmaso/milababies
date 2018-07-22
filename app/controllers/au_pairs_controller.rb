class AuPairsController < ApplicationController

  def index
    @aupairs = AuPair.all
  end

end