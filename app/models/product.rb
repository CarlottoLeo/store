class Product < ActiveRecord::Base
  validates_presence_of :name
  validates_length_of   :name, minimum: 3, maximum: 30
  validates_format_of   :name, with: /[\w]+([\s]?+[\w]+){1}+/

  validates_presence_of :value
  validates_numericality_of :value, greater_than: 0.01, allow_nil: false

  scope :get_all_by_name_asc, -> {order(name: :asc)}

  before_save :capitalize_name

  audited

  acts_as_paranoid

  def capitalize_name
    self.name = self.name.titleize
  end

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
