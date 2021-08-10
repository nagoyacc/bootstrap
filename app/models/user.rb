class User < ApplicationRecord
    validates :name, presence: true, length: { maximum: 30 }      # presence 空データで行けない
    validates :email, presence: true, length: { maximum: 255 }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
    before_validation { email.downcase! }      # email属性を強制的に小文字に変換
    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }     # 最小文字数
end
