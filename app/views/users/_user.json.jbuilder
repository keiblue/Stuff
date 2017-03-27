json.extract! user, :id, :Name, :Nick, :email, :address, :Password, :ZipCode, :phone, :created_at, :updated_at
json.url user_url(user, format: :json)
