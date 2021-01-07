class Comment < ApplicationRecord
  # prototyoesテーブルとのアソシエーション
   belongs_to :prototype  
  # usersテーブルとのアソシエーション
   belongs_to :user

  #  各バリデーションの設定
  validates :text,      presence: true
  validates :user,      presence: true
  validates :prototype, presence:true

end
