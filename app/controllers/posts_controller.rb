class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  def pre_create
    content = params[:post][:content]
    price = get_price(content)
    product_name, category = get_product_and_category(content)
    display_name = get_display_name(content)

    redirect_to controller: 'posts', action: 'new', content: content, min_price: price, product_name: product_name, category: category, display_name: display_name
  end

  # GET /posts/new
  def new
    @post = Post.new
    product = Product.new
    user = User.new
    @post.min_price = params['min_price'] if params.has_key? :min_price
    @post.max_price = params['max_price'] if params.has_key? :max_price
    @post.content = params['content'] if params.has_key? :content
    product.name = params['product_name'] if params.has_key? :product_name
    category = params['category'] if params.has_key? :category
    product.product_category = ProductCategory.find_by(category: category)
    user.display_name = params['display_name'] if params.has_key? :display_name

    @post.product = product
    @post.user = user
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    product_params = params[:post][:product_attributes];
    user_params = params[:post][:user_attributes];

    user = User.find_by(phone_number: user_params[:phone_number])
    if !user
      user = User.new
      user.display_name = user_params[:display_name]
      user.gender = user_params[:gender]
      user.location = user_params[:location]
      user.birthday = user_params[:birthday]
      user.phone_number = user_params[:phone_number]
      user.save
    end
    product = Product.new()
    product.name = product_params[:name];
    product.product_category_id = product_params[:product_category_id]
    product.save

    @post.user = user;
    @post.product = product;

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def get_price(content)
    price = content[ /\d+(?:\.\d+)?/ ]
  end

  #extract product_name and product_category
  def get_product_and_category(content)
    categ = "Other"
    product = ""
    content.split(" ").each do |word|
      category = ProductCategory.where("keywords LIKE ?", "%#{word}%")
      if category and category.first
        categ = category.first.category
        product = word
      end
    end
    return product.capitalize, categ
  end

  def get_display_name(content)
    keyword = "my name is"
    name = ""
    string = content.downcase
    if string.include? keyword
      name = string.partition(keyword).last.split.first.strip.capitalize
    end
    name
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:content, :min_price, :max_price, :user_id, :product_id)
    end
end
