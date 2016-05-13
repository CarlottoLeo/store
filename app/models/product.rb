class Product < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :value

  validates :value, numericality: { greater_than: 0.01 }

  has_one :item

  scope :get_all_by_name_asc, -> {order(name: :asc)}

  def self.get_collection_for_select_tag
    prods = Product.get_all_by_name_asc
    result = ""

    unless prods.nil?
      prods.each do |product|
        result += "<option value=\"{id: #{product.id}, value: #{product.value}}\">#{product.name}</option>\n"
      end
    end

    html = <<-HTML
    #{result}
    HTML

    return html.html_safe
  end
end
