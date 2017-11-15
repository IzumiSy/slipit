class ConfirmationGuard < Clearance::SignInGuard
  def call
    if signed_in? && current_user.confirmed_at?
      next_guard
    else
      # TODO
    end
  end
end
