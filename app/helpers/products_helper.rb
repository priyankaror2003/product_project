module ProductsHelper
  def get_name
    brand = @products_list.map{|e| {id:e.id,name:e.name}}
  end


  def get_brand
    brand = @products_list.map{|e| {id:e.id,brand:e.brand}}
  end

  def get_model
    get_model = @products_list.map{|e| {id:e.id,model:e.model}}
  end

  def get_ram
    ram_external_storage = @products_list.map{|e| {id:e.id,ram:e.ram}}
  end

  def get_external_storage
    ram_external_storage = @products_list.map{|e| {id:e.id,external_storage:e.external_storage}}
  end

end
