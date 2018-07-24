class TestimonialsController < ApplicationController
  before_action :find_au_pair, only: [:create]

  def new
    @testimonial = Testimonial.new
  end

  def create
    @testimonial = @au_pair.testimonials.build(testimonial_params)
   if @testimonial.save
    redirect_to au_pair_path(@au_pair)
   else
    render :new
   end
  end

  private

  def testimonial_params
    params.require(:testimonial).permit(:title, :description,:rating)
  end

  def find_au_pair
    @au_pair = AuPair.find(params[:au_pair_id])
  end

end