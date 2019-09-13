class Product < ApplicationRecord

  def self.get_product_list(product_id)
    if product_id.present?
      get_product_detail = Product.where("id=?",product_id)
    else
      get_product_detail = Product.all()
    end

  end
end
