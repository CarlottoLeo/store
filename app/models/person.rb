require 'cpf_cnpj'

class Person < ActiveRecord::Base
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

  before_save :capitalize_name

  audited

  has_many :orders, dependent: :destroy

  scope :get_all_by_name_asc, -> { order(name: :asc) }

  def capitalize_name
    self.name = self.name.titleize
  end

  def cpf_formatted
    return CPF.new(cpf).formatted
  end

  def name_cpf_formatted_s
    return "#{self.name} (CPF: #{cpf_formatted})"
  end

  def self.get_collection_for_select_tag
    people = Person.get_all_by_name_asc
    result = ""

    unless people.nil?
      people.each do |person|
        result += "<option value='#{person.cpf}'>#{person.name} (CPF: #{person.cpf_formatted})</option>\n"
      end
    end

    html = <<-HTML
    #{result}
    HTML

    return html.html_safe
  end
end
