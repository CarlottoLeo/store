class Product < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :value

  validates :value, numericality: { greater_than: 0.01 }

  has_one :item

  scope :get_all_by_name_asc, -> {order(name: :asc)}
end
