class AddAssociationToPluginRelease < ActiveRecord::Migration[7.2]
  def change
    add_reference :plugin_releases, :plugin, null: false, foreign_key: true
  end
end
