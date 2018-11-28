class Request < ApplicationRecord
  belongs_to :availability
  has_many :users
end
