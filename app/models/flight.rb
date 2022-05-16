class Flight < ApplicationRecord
  belongs_to :origin, class_name: 'Airport'
end
