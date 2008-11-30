class CreateDocs < ActiveRecord::Migration
  def self.up
    create_table :docs do |t|
      t.string :title
      t.text :body

      t.timestamps
    end

    if Rails.env.production?
      Doc.create!(
        :title => 'Wellcome!',
        :body => "右上のメニューから「アカウント」を選んでユーザー名とパスワードを設定してください。デフォルトのユーザー名、パスワードは「guanaco」、「arupaka」です。"
      )
    else
      load_fixture :docs
    end
  end

  def self.down
    drop_table :docs
  end
end
