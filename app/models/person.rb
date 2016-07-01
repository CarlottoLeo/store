require 'cpf_cnpj'

class Person < ActiveRecord::Base
  # active record validations
  validates :id, uniqueness: true

  validates :name,
    presence:   true, # must not be empty
    length: {         # length must be within 3..64 characters long
      minimum:  3,
      maximum:  64
    }

  validates :cpf,
    presence:   true, # must not be empty
    cpf:        true  # must be a valid cpf

  validates_uniqueness_of :cpf

  # active record actions
  before_save :capitalize_name

  # associations
  has_many :orders, dependent: :destroy
  has_one :address, dependent: :destroy

  # scoping
  scope :get_all_by_name_asc, -> { order(name: :asc) }

  # optional attributes
  audited

  attr_accessor :address

  def capitalize_name
    self.name = self.name.titleize
  end

  def cpf_formatted
    return CPF.new(cpf).formatted
  end

  def name_cpf_formatted_s
    return "#{self.name} (CPF: #{cpf_formatted})"
  end
end
=begin
  def get_formatted_audited_changes
    attributes_list = [
      CPF: ''
    ]

    self.audits.each do |audit|
      audit.audited_changes.each do |actual_info, changes|
        if audit.action == 'update'
          v.audited_changes.each do |key, val|

          if key == 'name' && val[0] != val[1]
            v.created_at.to_formatted_s(:short)
            t('messages.notice.audited_'+ key +'_change', from: val[0], to: val[1])
          end
        end
      end
    end

    html = <<-HTML
    <div class="alert alert-danger" role="alert">
      <h4>#{t('messages.error.header')}</h4>
      <p>#{messages}</p>
    </div>
    HTML

    html.html_safe
  end
=end
