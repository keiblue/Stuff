json.extract! product, :id, :titulo, :desc_corta, :desc, :precio, :tipo, :marca, :modelo, :stock, :created_at, :updated_at
json.url product_url(product, format: :json)
