class TrainingSession < ApplicationRecord
  belongs_to :user

validates :date, :activity, :duration, presence: true
validates :duration, numericality: { only_integer: true, greater_than: 0 }
end
