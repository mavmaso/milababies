class AuPairsController < ApplicationController
  def index
    @aupairs = AuPairService.search(search_query)
  end

  def new
    @au_pair = AuPair.new
  end

  def create
    @au_pair = AuPair.new(au_pair_params.merge(build_status))
    if @au_pair.save
      redirect_to @au_pair
    else
      render :new
    end
  end

  def show
    @au_pair = AuPair.find(params[:id])
  end

  private

  def search_query
    params[:query]
  end

  def au_pair_params
    params.require(:au_pair).permit(:name, :email, :phone, :cpf, :skills,
                                    :languages, :degree, :birth_date, :city,
                                    :wage, :photo)
  end

  def build_status
    admin_signed_in? ? { status: :approved } : { status: :pending }
  end
end
