module ProductsHelper
  def get_brand
    brand = @products.pluck(:brand)
  end

  def get_model
    get_model = @products.pluck(:model)
  end

  def get_ram
    ram_external_storage = @products.pluck(:ram)
  end

end
