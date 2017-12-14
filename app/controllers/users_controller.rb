class UsersController < Clearance::UsersController
  def url_after_create
    flash[:notice] = 'User confirmation mail has sent to your email :)'
    sign_in_path
  end
end
