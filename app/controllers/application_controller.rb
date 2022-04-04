class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: :home
  before_action :access, only: :home

  def after_sign_in_path_for(resource)
    index_path
  end

  def access
    redirect_to index_path if user_signed_in?
  end

end