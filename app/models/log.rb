class Log < ApplicationRecord
  belongs_to :user
  belongs_to :furima
  has_one :destination
end
