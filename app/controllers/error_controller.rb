class ErrorController < ApplicationController
  def index
  end
  def not_found
    render file: "#{Rails.root}/public/404.html", status: :not_found, layout: true
  end
end
