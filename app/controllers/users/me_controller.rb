class Users::MeController < ApplicationController
  include BookmarkSearch

  before_action :require_login

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
