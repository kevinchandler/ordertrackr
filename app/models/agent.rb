class Agent < ApplicationRecord
  belongs_to :business
  has_many :orders
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
