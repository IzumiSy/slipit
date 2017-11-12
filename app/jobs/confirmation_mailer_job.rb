class ConfirmationMailerJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # TODO: Sends a confirmation mail to registerers
  end
end
