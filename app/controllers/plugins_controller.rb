class PluginsController < ApplicationController
  before_action :set_plugin, only: %i[ show edit update destroy ]

  # GET /plugins or /plugins.json
  def index
    @plugins = Plugin.all

    @side_menu << { name: "Plugins", icon_path: "icons/plugin_icon.svg", dest: plugins_path, selected: true }
    @side_menu << { name: "Guides", icon_path: "icons/book_icon.svg", dest: guides_path, selected: false }

    @breadcrumbs << { name: "Plugins", path: plugins_path }
    @action_buttons << { name: "New plugin", icon_path: "icons/plus_icon.svg", path: new_plugin_path }
  end

  # GET /plugins/1 or /plugins/1.json
  def show
    @plugin = Plugin.find(params[:id])
    @plugin_releases = @plugin.plugin_release.reverse

    @breadcrumbs << { name: "Plugins", path: plugins_path }
    @breadcrumbs << { name: @plugin.name, path: plugin_path(params[:id]) }

    @action_buttons << { name: "Edit", icon_path: "icons/edit_icon.svg", path: edit_plugin_path(params[:id]) }
    @action_buttons << { name: "Upload new release", icon_path: "icons/upload_icon.svg", path: new_plugin_plugin_release_path(@plugin) }

    @side_menu << { name: "Releases", icon_path: "icons/release_icon.svg", dest: plugin_path(@plugin), selected: true }
    @side_menu << { name: "Settings", icon_path: "icons/cog_icon.svg", dest: plugin_settings_path(@plugin), selected: false }
  end

  # GET /plugins/new
  def new
    @breadcrumbs << { name: "Plugins", path: plugins_path }
    @breadcrumbs << { name: "New plugin", path: new_plugin_path }
    @plugin = Plugin.new

    @side_menu << { name: "Plugins", icon_path: "icons/plugin_icon.svg", dest: plugins_path, selected: true }
  end

  # GET /plugins/1/edit
  def edit
    @breadcrumbs << { name: "Plugins", path: plugins_path }
    @breadcrumbs << { name: @plugin.name, path: plugin_path(params[:id]) }

    @action_buttons << { name: "Edit", icon_path: "icons/edit_icon.svg", path: edit_plugin_path(params[:id]) }
    @action_buttons << { name: "Upload new release", icon_path: "icons/upload_icon.svg", path: new_plugin_plugin_release_path(@plugin) }

    @side_menu << { name: "Releases", icon_path: "icons/release_icon.svg", dest: plugin_path(@plugin), selected: true }
    @side_menu << { name: "Settings", icon_path: "icons/cog_icon.svg", dest: plugin_settings_path(@plugin), selected: false }
  end

  # POST /plugins or /plugins.json
  def create
    @breadcrumbs << { name: "Plugins", path: plugins_path }
    @breadcrumbs << { name: "New plugin", path: new_plugin_path }
    @plugin = Plugin.new(plugin_params)

    respond_to do |format|
      if @plugin.save
        format.html { redirect_to plugin_url(@plugin), notice: "Plugin was successfully created." }
        format.json { render :show, status: :created, location: @plugin }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @plugin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /plugins/1 or /plugins/1.json
  def update
    respond_to do |format|
      if @plugin.update(plugin_params)
        format.html { redirect_to plugin_url(@plugin), notice: "Plugin was successfully updated." }
        format.json { render :show, status: :ok, location: @plugin }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @plugin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /plugins/1 or /plugins/1.json
  def destroy
    @plugin.destroy!

    respond_to do |format|
      format.html { redirect_to plugins_url, notice: "Plugin was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plugin
      @plugin = Plugin.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def plugin_params
      params.require(:plugin).permit(:name, :description, :published, :major, :minor, :patch, :status)
    end
end
