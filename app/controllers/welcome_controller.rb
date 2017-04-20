class WelcomeController < ApplicationController
  def index
    @products = Product.new
    @categories = Category.new
  end
end
