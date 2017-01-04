class Business < ApplicationRecord
  has_many :agents, :customers, :drivers
end
