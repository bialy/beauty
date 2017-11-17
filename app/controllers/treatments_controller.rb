class TreatmentsController < ApplicationController
  load_and_authorize_resource
  def index   
    @offer = Offer.find(params[:offer_id])
    @treatments = @offer.treatments
  end

  def show
    @offer = Offer.find(params[:offer_id])
    @treatment = @offer.treatments.find(params[:id])
  end

  def new
    @offer = Offer.find(params[:offer_id])
    @treatment = @offer.treatments.build
  end

  def edit
    @offer = Offer.find(params[:offer_id])  
    @treatment = @offer.treatments.find(params[:id])
  end

  def create
    @offer = Offer.find(params[:offer_id])
    @treatment = @offer.treatments.build(params[:treatment])
    if @treatment.save
      redirect_to offer_treatment_url(@offer, @treatment)
    else
      render :action => 'new'
    end
  end

  def update
    @offer = Offer.find(params[:offer_id])
    @treatment = Treatment.find(params[:id])
    if @treatment.update_attributes(params[:treatment])
      redirect_to offer_treatment_url(@offer, @treatment)
    else
      render :action => 'edit'
    end
  end

  def destroy
    @offer = Offer.find(params[:offer_id])
    @treatment = Treatment.find(params[:id])
    @treatment.destroy
    redirect_to offer_treatments_path(@offer)
  end
end
