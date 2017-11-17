# encoding: UTF-8
class PricesController < ApplicationController
  load_and_authorize_resource
  # GET /prices
  # GET /prices.json
  def index
    @prices = Price.where(:category => "Pielęgnacja dłoni")
    @prices_feet = Price.where(:category => "Pielęgnacja stóp")
    @prices_face = Price.where(:category => "Pielęgnacja twarzy")
    @prices_cp = Price.where(:category => "Zabiegi firmowe (Rejuvi)")
    @prices_beauty = Price.where(:category => "Zabiegi upiększające")
    @prices_make_up = Price.where(:category => "Makijaż okolicznościowy")
    @prices_depilation = Price.where(:category => "Depilacja woskiem")
    @prices_massage = Price.where(:category => "Masaż")
  
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @prices }
    end
  end

  # GET /prices/1
  # GET /prices/1.json
  def show
    @price = Price.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @price }
    end
  end

  # GET /prices/new
  # GET /prices/new.json
  def new
    @offers = Offer.all
    @price = Price.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @price }
    end
  end

  # GET /prices/1/edit
  def edit
    @price = Price.find(params[:id])
    @offer_price = @price.offer.name
  end

  # POST /prices
  # POST /prices.json
  def create
    @price = Price.new(params[:price])

    respond_to do |format|
      if @price.save
        format.html { redirect_to @price, notice: 'Price was successfully created.' }
        format.json { render json: @price, status: :created, location: @price }
      else
        format.html { render action: "new" }
        format.json { render json: @price.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /prices/1
  # PUT /prices/1.json
  def update
    @price = Price.find(params[:id])

    respond_to do |format|
      if @price.update_attributes(params[:price])
        format.html { redirect_to @price, notice: 'Price was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @price.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prices/1
  # DELETE /prices/1.json
  def destroy
    @price = Price.find(params[:id])
    @price.destroy

    respond_to do |format|
      format.html { redirect_to prices_url }
      format.json { head :no_content }
    end
  end
end
