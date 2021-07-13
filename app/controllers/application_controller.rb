class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
     root_path
  end

  private

  def librarian_check
    redirect_to root_path, alert: "Permission Denied!" unless current_user.librarian?
  end
end
