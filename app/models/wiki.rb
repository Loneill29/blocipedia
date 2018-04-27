class Wiki < ApplicationRecord
  belongs_to :user

<<<<<<< HEAD
  validates :title, length: { minimum: 5 }, presence: true
  validates :body, length: { minimum: 20 }, presence: true
=======
>>>>>>> user-roles
end
