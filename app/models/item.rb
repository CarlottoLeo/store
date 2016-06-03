class Item < ActiveRecord::Base
  attr_writer :_destroy

  validates :amount,
    presence: true,
    numericality: {
      higher_than: 0
    }

  belongs_to :order
end
