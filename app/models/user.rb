class User < ApplicationRecord
  #名前を15文字まで
  validates :name, presence: true, length: { maximum:15 }  
  #emailの正規表現を追加
  validates :email, presence: true, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\Z/i }
  #パスワードの文字制限8-32まで
  #パスワードをアルファベット、数字の混合のみ可能
  validates :password, presence: true, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,32}\z/i }
  
  
  has_secure_password
  
  has_many :topics
  has_many :favorites
  has_many :favorite_topics, through: :favorites, source: 'topic'
  
  has_many :comments, foreign_key: 'Topic_id'
  
  
end
