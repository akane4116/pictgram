class User < ApplicationRecord
  #名前を32文字まで
  validates :name, presence: true, length: { maximum:32}
  #emailの正規表現を追加
  validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+.)+[a-z]{2,})\z/i }
  #パスワードの文字制限8-32まで
  validates :password, presence: true, length: { in: 8..32}
  #パスワードをアルファベット、数字の混合のみ可能
  validates :password, presence: true, format: { with: /\A(?=.&#042;?[a-z])(?=.&#042;?\d)[a-z\d]+\z/i }
  validates :password_confirmation, presence: true, confirmation: true
  has_secure_password
end

