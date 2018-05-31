class Wiki < ApplicationRecord
  #belongs_to :user

  validates :title, length: { minimum: 5 }, presence: true
<<<<<<< HEAD
  validates :body, length: { minimum: 5 }, presence: true
=======
  validates :body, length: { minimum: 20 }, presence: true
>>>>>>> user-roles
end
