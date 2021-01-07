class CreatePrototypes < ActiveRecord::Migration[6.0]
  def change
    create_table :prototypes do |t|

      # 以下 title,catch_copy,concept,userカラムをprototypeテーブルへ追加のための記述
      t.string     :title,             null: false
      t.text       :catch_copy,         null: false
      t.text       :concept,            null: false
      t.references :user,               foreign_key: true

      t.timestamps
    end 
  end
end
