class HomeController < ApplicationController
  before_action :authenticate_admin!, only: [:admin]

  def index; end

  def admin
    @proposals = Proposal.all
  end
end
