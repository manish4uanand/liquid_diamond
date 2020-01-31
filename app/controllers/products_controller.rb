class ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product, only: [:show ]
  
  def index
    @products = Product.all
    @price_arr = @products.map{|p| p.price }.uniq.sort
    @material_arr = @products.map{|p| p.material }.uniq.sort

    respond_to do |format|
      format.html
      # format.csv { send_data @products.to_csv }
      format.xls #{ send_data @products.to_csv(col_sep: "\t") }
    end
  end
  
  def show
  end
  
  def filter
    conditions = ""
    conditions << "price LIKE '#{params[:price]}'" unless params[:price].blank?
    conditions << " AND material LIKE '#{params[:material]}'" unless params[:material].blank?
    # binding.pry
    conditions.sub!(/^AND/, '')
    if conditions.start_with?(' AND')
      conditions = conditions.sub(' AND', '')
    end

    if !conditions.blank?
      @products = Product.where(conditions)
    else
      @products = Product.all
    end
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end

end
