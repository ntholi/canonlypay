class AdvertsController < ApplicationController
  before_action :set_advert, only: [:show, :edit, :update, :destroy]

  # GET /adverts
  # GET /adverts.json
  def index
    @posts = Post.all
  end

  # GET /adverts/1
  # GET /adverts/1.json
  def show
  end

  # GET /adverts/new
  def new
    @advert = Advert.new
    advertiser = Advertiser.new
    product = Product.new

    @advert.advertiser = advertiser
    @advert.product = product
  end

  # GET /adverts/1/edit
  def edit
  end

  # POST /adverts
  # POST /adverts.json
  def create
    @advert = Advert.new(advert_params)
    product_params = params[:advert][:product_attributes];
    advertiser_params = params[:advert][:advertiser_attributes]; 

    advertiser = Advertiser.find_by(email: advertiser_params[:email])
    if !advertiser
      advertiser = Advertiser.new
      advertiser.first_name = advertiser_params[:first_name]
      advertiser.last_name = advertiser_params[:last_name]
      advertiser.email = advertiser_params[:email]
      advertiser.company_name = advertiser_params[:company_name]
      advertiser.location = advertiser_params[:location]
      advertiser.phone_number = advertiser_params[:phone_number]
      advertiser.website = advertiser_params[:website]
      advertiser.save
    end
    product = Product.new
    product.name = product_params[:name];
    product.product_category_id = product_params[:product_category_id]
    product.price = product_params[:price]; 
    product.year_made = product_params[:year_made];
    product.description = product_params[:description];
    product.save

    @advert.advertiser = advertiser
    @advert.product = product

    respond_to do |format|
      if @advert.save
        format.html { redirect_to @advert, notice: 'Advert was successfully created.' }
        format.json { render :show, status: :created, location: @advert }
      else
        format.html { render :new }
        format.json { render json: @advert.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /adverts/1
  # PATCH/PUT /adverts/1.json
  def update
    respond_to do |format|
      if @advert.update(advert_params)
        format.html { redirect_to @advert, notice: 'Advert was successfully updated.' }
        format.json { render :show, status: :ok, location: @advert }
      else
        format.html { render :edit }
        format.json { render json: @advert.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /adverts/1
  # DELETE /adverts/1.json
  def destroy
    @advert.destroy
    respond_to do |format|
      format.html { redirect_to adverts_url, notice: 'Advert was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_advert
      @advert = Advert.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def advert_params
      params.require(:advert).permit(:advertiser_id, :product_id)
    end
end
