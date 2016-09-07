require 'will_paginate/array'
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  layout :layout_by_resource
  before_filter :login_current_date, :if => :devise_controller?
  before_filter :set_local

  def after_sign_in_path_for(resource)
    if current_user.rule <= 2
      '/admin/dashboard'
    else
      account_path(current_user.account)
    end
  end

  def after_sign_out_path_for(resource)
    '/admin/login'
  end

  def layout_by_resource
    if devise_controller? && resource_name == :user && action_name == 'edit'
      "session"
    elsif devise_controller? && resource_name == :user && action_name == 'new'
      "session"
    elsif devise_controller? && resource_name == :user && action_name == 'create'
      "session"
    elsif devise_controller?
      "session"
    end
  end

  private
    def login_current_date
      if current_user
        current_user.login_at = Time.now
        current_user.save
      end
    end

    def set_local
      if current_user
        I18n.locale = current_user.locale
      end
    end
end
