class AuPairsController < ApplicationController
  def index
    @aupairs = if search_query
                 AuPair.where('name LIKE ?', "%#{search_query}%")
               else
                 AuPair.all
               end
  end

  def new
    @au_pair = AuPair.new
  end

  def create
    @au_pair = AuPair.new(au_pair_params)
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
end
