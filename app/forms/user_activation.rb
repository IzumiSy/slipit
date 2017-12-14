class UserActivation < ApplicationForm
  attr_accessor :user

  validates :user, presence: true

  def is_activated?
    !!@user.activated_at
  end

  def call
    validate!
    @user.activated_at = Time.now
    @user.save!
    @user
  rescue ActiveModel::ValidationError
    nil
  end
end
