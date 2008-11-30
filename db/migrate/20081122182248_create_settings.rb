class CreateSettings < ActiveRecord::Migration
  def self.up
    create_table :settings do |t|
      t.string :title
      t.text :description

      t.timestamps
    end

    Setting.create!(
      :title => 'Guanaco Docs',
      :description => 'テキストを書くためのシンプルなアプリケーション'
    )
  end

  def self.down
    drop_table :settings
  end
end
