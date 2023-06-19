class User < ApplicationRecord
  has_many :visits
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
