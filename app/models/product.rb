require 'csv'
require 'socket'
class Product < ApplicationRecord

  def self.get_product_list(product_id)
    if product_id.present?
      get_product_detail = Product.where("id=?",product_id)
    else
      get_product_detail = Product.all()
    end

  end

  def self.to_csv(products,base_url)
    column_names = ["Name","Model","Brand","Year","RAM","Exteranl Storage","Link"]
    CSV.generate do |csv|
      csv << column_names
      arr = {}
      products.each do |data_csv|
        arr['name'] = data_csv['name']
        arr['model'] = data_csv['model']
        arr['brand'] = data_csv['brand']
        arr['year'] = data_csv['year']
        arr['ram'] = data_csv['ram']
        arr['external_sorage'] = data_csv['external_storage']
        arr['Link'] = "#{base_url}/products/id/#{data_csv['id']}"
        csv << arr.values
      end
    end

  end
end
