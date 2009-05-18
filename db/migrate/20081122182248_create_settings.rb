class CreateSettings < ActiveRecord::Migration
  def self.up
    create_table :settings do |t|
      t.string :title
      t.text :description
      t.string :flavor

      t.timestamps
    end

    load_data :settings
  end

  def self.down
    drop_table :settings
  end
end
