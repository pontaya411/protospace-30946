class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # 以下Userモデルで、「name,profile,occupation,positionカラムが空では保存できない」というバリデーションを設定する記述
  validates :name,       presence: true
  validates :profile,    presence: true
  validates :occupation, presence: true
  validates :position,   presence: true

  # prototypesテーブルとのアソシエーション
  has_many :prototypes
  # commentsテーブルとのアソシエーション
  has_many :comments
end
