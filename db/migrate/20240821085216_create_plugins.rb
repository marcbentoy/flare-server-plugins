class CreatePlugins < ActiveRecord::Migration[7.2]
  def change
    create_table :plugins do |t|
      t.string :name
      t.text :description
      t.boolean :published
      t.integer :major
      t.integer :minor
      t.integer :patch
      t.string :status

      t.timestamps
    end
  end
end
