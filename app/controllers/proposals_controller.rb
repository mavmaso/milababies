class ProposalsController < ApplicationController
  before_action :set_proposal, only: [:show]
  before_action :find_au_pair, only: [:new, :create]

  def new
    @proposal = @au_pair.proposals.build
  end

  def create
    @proposal = @au_pair.proposals.build(proposal_params)
    if @proposal.save
      redirect_to [@proposal.au_pair, @proposal],
                  notice: 'Proposta enviada com sucesso'
    else
      flash[:alert] = 'Proposta não pode ser enviada'
      render :new
    end
  end

  def show; end

  private

  def proposal_params
    params.require(:proposal).permit(:booked_date,
                                     :start_hour, :end_hour, :message)
  end

  def set_proposal
    @proposal = Proposal.find(params[:id])
  end

  def find_au_pair
    @au_pair = AuPair.find(params[:au_pair_id])
  end
end
