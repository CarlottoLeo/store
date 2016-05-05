json.array!(@orders) do |order|
  json.extract! order, :id, :name, :value
  json.url order_url(order, format: :json)
end
