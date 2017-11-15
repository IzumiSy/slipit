class ActivationGuard < Clearance::SignInGuard
  def call
    if signed_in? && !current_user.activated_at?
      return failure('You must confirm your email address')
    end

    next_guard
  end
end
