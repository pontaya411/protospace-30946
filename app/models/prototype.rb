class Prototype < ApplicationRecord
  # userテーブルとのアソシエーションの記述
  belongs_to :user
  has_one_attached :image
  # commentsテーブルとのアソシエーション
  has_many :comments
  # ひとつのprototypeが削除されたら関連する情報も削除される記述
  has_many :comments, dependent: :destroy
  # 解答よりコメントアウト
  # has_many :users, dependent: :destroy

  # 各バリデーション設定
  validates :image, presence: true
  validates :title, presence: true
  validates :catch_copy, presence: true
  validates :concept, presence:true

end
