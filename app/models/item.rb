class Item < ActiveRecord::Base
  belongs_to :order
  before_save :calcula_total

  def calcula_total
    self.total = self.value * self.amount
  end
end
