class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  before_action :print_display_message
  after_action :after_display_message

  def not_found
    puts "Hello"
    render file: "#{Rails.root}/public/404.html", status: :not_found, layout: false
  end

  private

  def print_display_message
    puts "======================================"
    puts "I am a filter before the action filter"
    puts "======================================"
  end

  def after_display_message
    puts "============================="
    puts "I am in after dispaly message"
    puts "============================="
  end

  
end
