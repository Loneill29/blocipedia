class Wiki < ApplicationRecord
  belongs_to :user
  has_many :collaborators, dependent: :destroy

  validates :title, length: { minimum: 5 }, presence: true
  validates :body, length: { minimum: 5 }, presence: true
end
