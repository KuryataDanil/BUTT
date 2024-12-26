# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    render html: "<h1>Welcome to Booking Platform</h1><a href='#{login_path}'>Login</a> or <a href='#{new_user_path}'>Sign Up</a>".html_safe
  end
end

