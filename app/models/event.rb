class Event < ApplicationRecord
  belongs_to :source
  validates :name, presence: true
end
