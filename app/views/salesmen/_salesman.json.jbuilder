json.extract! salesman, :id, :nome, :telefone, :email, :cargo, :crypted_password, :created_at, :updated_at
json.url salesman_url(salesman, format: :json)
