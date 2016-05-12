module ApplicationHelper
  # Allows easier conversion and formatting for currency numbers
  def convert_number_to_money(value)
    return number_to_currency(value, {:unit => t('currency.unit')})
  end
end
