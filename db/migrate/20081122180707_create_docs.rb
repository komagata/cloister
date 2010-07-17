class CreateDocs < ActiveRecord::Migration
  def self.up
    create_table :docs do |t|
      t.string :title
      t.text :body
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def self.down
    drop_table :docs
  end
end
