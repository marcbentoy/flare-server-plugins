class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  before_action :set_side_menu
  before_action :set_breadcrumbs
  before_action :set_action_buttons

  def set_breadcrumbs
    @breadcrumbs = []
  end

  def set_side_menu
    @side_menu = []
  end

  def set_action_buttons
    @action_buttons = []
  end
end
