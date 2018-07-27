class HomeController < ApplicationController
  before_action :authenticate_admin!, only: [:admin]

  def index; end

  def admin
    @proposals = Proposal.all
    @au_pair = AuPair.all
  end

  def who; end
end
