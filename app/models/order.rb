class Order < ActiveRecord::Base
  # active record validations
  validates :person_id, presence: true
  validates :items,  presence: true

  # active record actions
  before_save :merge_duplicates, :calculate_totals

  # associations
  has_many :items, dependent: :destroy
  belongs_to :person

  # scoping
  scope :filter_by_person, ->(id) {where('person_id = ?', id)}

  # optional attributes
  audited
  acts_as_paranoid
  accepts_nested_attributes_for :items, reject_if: :all_blank, allow_destroy: true


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
