class Request < ApplicationRecord
  belongs_to :availability
  belongs_to :user
end
