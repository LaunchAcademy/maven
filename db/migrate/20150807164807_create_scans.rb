class CreateScans < ActiveRecord::Migration
  def change
    create_table :scans do |t|
      t.string :content, null: false
      t.timestamps null: false
      t.datetime :synced_at
    end
  end
end
