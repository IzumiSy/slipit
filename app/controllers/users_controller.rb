class UsersController < Clearance::UsersController
  before_action :require_login

  def show
    @user = User.find(params.require(:id))
  end

  def edit
    @user = User.find(params.require(:id))
  end

  def update
    # TODO
  end

  def url_after_create
    flash[:notice] = 'User confirmation mail has sent to your email'
    sign_in_path
  end
end
