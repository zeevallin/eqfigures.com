class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  before_filter :redirect_to_ssl

  helper_method :current_user
  hide_action :current_user
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :possible_choices
  hide_action :possible_choices
  def possible_choices
    @possible_choices ||= Character.all.map(&:id).permutation(2).map(&:sort).uniq
  end

  helper_method :current_choices
  hide_action :current_choices
  def current_choices
    return [] unless current_user
    @current_choices ||= current_user.choices.map{ |choice| [choice.a, choice.b] }.map(&:sort).uniq
  end

  helper_method :available_choices
  hide_action :available_choices
  def available_choices
    @available_choices ||= possible_choices - current_choices
  end

private

  def user_not_authorized
    flash[:alert] = "Access denied."
    redirect_to (request.referrer || root_path)
  end

  def redirect_to_ssl
    if Rails.env.production?
      redirect_to :protocol => "https://" unless (request.ssl?)
    end
  end

end
