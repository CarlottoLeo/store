class Product < ActiveRecord::Base
  validates :name,
    presence: true,

    length: {
      minimum: 3,
      maximum: 64
    },

    format: {
      with: /[\w]+([\s]?+[\w]+){1}+/
    }

  validates :value,
    presence: true,

    numericality: {
      greater_than_or_equal_to: 0.01,
      allow_nil: false
    }

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
        result += "<option value='#{product.id}' item-value='#{product.value}'>#{product.name}</option>\n"
      end
    end

    html = <<-HTML
    #{result}
    HTML

    return html.html_safe
  end
end
