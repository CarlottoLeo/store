class Order < ActiveRecord::Base
  has_many :items, dependent: :destroy
  belongs_to :person

  scope :filter_by_person, ->(id) {where('person_id = ?', id)}

  audited

  validates :person_id, presence: true
  validates :items,  presence: true

  acts_as_paranoid
  accepts_nested_attributes_for :items, reject_if: :all_blank, allow_destroy: true

  before_save :merge_duplicates, :calculate_totals

  def merge_duplicates
    items = []

    self.items.each do |item|
      pos = items.find_index { |i| i.prodid == item.prodid }

      if pos
        items[pos][:amount] += item.amount
        items[pos][:total]   = items[pos][:amount] * items[pos][:value]
      else
        items.push item
      end
    end

    self.items = items
  end

  def calculate_totals
    self.total_value = 0

    self.items.each do |item|
      unless item.nil?
        self.total_value += item.total
      end
    end
  end
end
