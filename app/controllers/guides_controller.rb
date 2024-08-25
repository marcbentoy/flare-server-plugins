class GuidesController < ApplicationController
  def show
    @side_menu << { name: "Plugins", icon_path: "icons/plugin_icon.svg", dest: plugins_path, selected: false }
    @side_menu << { name: "Guides", icon_path: "icons/book_icon.svg", dest: guides_path, selected: true }

    @breadcrumbs << { name: "Guides", path: "" }

    # @action_buttons << { name: "New plugin", icon_path: "icons/plus_icon.svg", path: new_plugin_path }
  end
end
