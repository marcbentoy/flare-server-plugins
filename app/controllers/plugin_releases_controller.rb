class PluginReleasesController < ApplicationController
  def new
    @plugin = Plugin.find(params[:plugin_id])
    @plugin_release = @plugin.plugin_release.new

    @breadcrumbs << { name: "Plugins", path: plugins_path }
    @breadcrumbs << { name: @plugin.name.truncate(16), path: plugin_path(@plugin.id) }
    @breadcrumbs << { name: "New Release", path: "" }

    @side_menu << { name: "Releases", icon_path: "icons/release_icon.svg", dest: plugin_path(@plugin), selected: true }
    @side_menu << { name: "Settings", icon_path: "icons/cog_icon.svg", dest: plugin_settings_path(@plugin), selected: false }
  end

  def create
    @plugin = Plugin.find(params[:plugin_id])
    @plugin_release = @plugin.plugin_release.new(plugin_release_params)

    @breadcrumbs << { name: "Plugins", path: plugins_path }
    @breadcrumbs << { name: @plugin.name.truncate(16), path: plugin_path(@plugin.id) }
    @breadcrumbs << { name: "New Release", path: "" }

    @side_menu << { name: "Releases", icon_path: "icons/release_icon.svg", dest: plugin_path(@plugin), selected: true }
    @side_menu << { name: "Settings", icon_path: "icons/cog_icon.svg", dest: plugin_settings_path(@plugin), selected: false }

    if @plugin_release.save
      redirect_to plugin_url(@plugin), notice: "Plugin release was successfully created!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    plugin_id = params[:id]
    plugin_release_id = params[:plugin_id]
    @plugin = Plugin.find(plugin_id)
    @plugin_release = PluginRelease.find(plugin_release_id)

    @breadcrumbs << { name: "Plugins", path: plugins_path }
    @breadcrumbs << { name: @plugin.name.truncate(16), path: plugin_path(@plugin.id) }
    @breadcrumbs << { name: @plugin_release.code_name, path: "" }

    @side_menu << { name: "Releases", icon_path: "icons/release_icon.svg", dest: plugin_path(@plugin), selected: true }
    @side_menu << { name: "Settings", icon_path: "icons/cog_icon.svg", dest: plugin_settings_path(@plugin), selected: false }

    @action_buttons << { name: "Upload new release", icon_path: "icons/upload_icon.svg", path: new_plugin_plugin_release_url(@plugin) }
  end

  private
    def plugin_release_params
      params.require(:plugin_release).permit(:code_name, :major, :minor, :patch)
    end
end
