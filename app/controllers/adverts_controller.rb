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
    company = Company.new
    product = Product.new

    @advert.company = company
    @advert.product = product
  end

  # GET /adverts/1/edit
  def edit
  end

  # POST /adverts
  # POST /adverts.json
  def create
    @advert = Advert.new(advert_params)
    @advert.company = get_saved_company()
    @advert.product = get_saved_product()

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
    @advert.company = get_saved_company()
    @advert.product = get_saved_product()

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

  def get_saved_company
    company_params = params[:advert][:company_attributes]; 
    company = Company.find_by(email: company_params[:email])
    if !company
      company = @advert.company || Company.new
    end
    company.first_name = company_params[:first_name]
    company.last_name = company_params[:last_name]
    company.email = company_params[:email]
    company.company_name = company_params[:company_name]
    company.location = company_params[:location]
    company.phone_number = company_params[:phone_number]
    company.website = company_params[:website]
    company.save
    return company
  end

  def get_saved_product
    product_params = params[:advert][:product_attributes];
    product = @advert.product || Product.new
    product.name = product_params[:name];
    product.product_category_id = product_params[:product_category_id]
    product.price = product_params[:price]; 
    product.year_made = product_params[:year_made];
    product.description = product_params[:description];
    product.save
    return product
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_advert
      @advert = Advert.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def advert_params
      params.require(:advert).permit(:company_id, :product_id)
    end
end
