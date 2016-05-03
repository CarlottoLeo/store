##
# Classe *Product* é usada para guardar informações de produtos
# que são pedidos pelos clientes
#
#
#
class Product < ActiveRecord::Base
  def self.ucname
    name.titleize
  end

  def self.total_value
    value * quantity
  end
end
