class Visit < ApplicationRecord
  has_one :user
  has_one :bicycle
end
