class CreatePluginReleases < ActiveRecord::Migration[7.2]
  def change
    create_table :plugin_releases do |t|
      t.string :code_name
      t.integer :major
      t.integer :minor
      t.integer :patch

      t.timestamps
    end
  end
end
