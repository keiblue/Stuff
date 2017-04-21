class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_categories

  private

  def set_categories
  	@Categories = Category.all
  end
end
