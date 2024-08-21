class PluginsController < ApplicationController
  before_action :set_plugin, only: %i[ show edit update destroy ]

  # GET /plugins or /plugins.json
  def index
    @plugins = Plugin.all
  end

  # GET /plugins/1 or /plugins/1.json
  def show
  end

  # GET /plugins/new
  def new
    @plugin = Plugin.new
  end

  # GET /plugins/1/edit
  def edit
  end

  # POST /plugins or /plugins.json
  def create
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
