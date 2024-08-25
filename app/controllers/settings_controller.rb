class SettingsController < ApplicationController
  def show
    @account = "vince"
  end

  def plugin
    @plugin = Plugin.find(params[:plugin_id])

    @breadcrumbs << { name: "Plugins", path: plugins_path }
    @breadcrumbs << { name: @plugin.name, path: plugin_path(@plugin) }

    @action_buttons << { name: "Edit", icon_path: "icons/edit_icon.svg", path: edit_plugin_path(@plugin) }
    @action_buttons << { name: "Upload new release", icon_path: "icons/upload_icon.svg", path: new_plugin_plugin_release_path(@plugin) }

    @side_menu << { name: "Releases", icon_path: "icons/release_icon.svg", dest: plugin_path(@plugin), selected: false }
    @side_menu << { name: "Settings", icon_path: "icons/cog_icon.svg", dest: plugin_path(@plugin), selected: true }
  end
end
