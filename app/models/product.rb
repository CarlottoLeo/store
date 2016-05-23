class Product < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :value

  validates_numericality_of :value, greater_than: 0.01, allow_nil: false

  scope :get_all_by_name_asc, -> {order(name: :asc)}

  audited

  acts_as_paranoid

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
