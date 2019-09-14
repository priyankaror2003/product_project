require 'csv'
class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    page = params[:page] || 1
    per_page = params[:per_page] || 25
    @products_list = Product.all
    if params['name'].present? ||  params['brand'].present? || params['year'].present? || params['ram'].present? ||  params['external_storage'].present?
      name = params['name']
      brand = params['brand']
      model = params['model']
      year = params['year']
      ram = params['ram']
      external_storage = params['external_storage']
      where_clause = name.present? ? "name = '#{name}' and " : ''
      where_clause = where_clause+(brand.present? ? " brand='#{brand}' and " : '')
      where_clause = where_clause+(model.present? ? " model='#{model}' and " : '')
      where_clause =  where_clause+(year.present? ?  " year='#{year}' and " : '')
      where_clause =  where_clause+(ram.present? ? " ram='#{ram}' and " : '')
      where_clause =  where_clause+(external_storage.present? ? " external_storage='#{external_storage}'  " : '')
      check_clause = where_clause.split()

      if check_clause.last == "and"
        check_clause.pop
        where_clause = check_clause.join(" ")
      end
      @products = Product.where(where_clause).paginate(:page => page,:per_page =>per_page)
    else
      @products = @products_list.paginate(:page => page,:per_page =>per_page)
    end

    if params['products_download']
      respond_to do |format|
        format.html
        format.csv { send_data Product.to_csv(@products,request.base_url) }
      end
    end


  end



  # GET /products/1
  # GET /products/1.json
  def show
    product_id = params['id']
    @get_product = Product.get_product_list(product_id)
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def product_params
    params.fetch(:product, {})
  end
end
