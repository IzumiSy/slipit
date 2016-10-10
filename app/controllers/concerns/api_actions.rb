module ApiActions
  extend ActiveSupport::Concern

  included do
    # noop
  end

  def create

  end

  def update

  end

  def destroy

  end

  def search
    render action: 'results'
  end
end
