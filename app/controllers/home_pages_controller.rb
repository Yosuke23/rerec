class HomePagesController < ApplicationController
  before_action :un_logged_in_user, only: :started_page
  def home
  end

  def about
  end

  def help
  end

  def contact
  end

  def started_page
  end
end
