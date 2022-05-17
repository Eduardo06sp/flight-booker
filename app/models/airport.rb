class Airport < ApplicationRecord
  has_many :flights, dependent: :destroy
end
