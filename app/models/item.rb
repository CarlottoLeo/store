class Item < ActiveRecord::Base
  validates :amount,
    presence: true,
    numericality: {
      higher_than: 0
    }

  belongs_to :order
  before_save :calcula_total

  def calcula_total
    self.total = self.value * self.amount
  end
end
