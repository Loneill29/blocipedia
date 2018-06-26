class User < ApplicationRecord

  has_many :wikis, dependent: :destroy
  has_many :collaborators, dependent: :destroy
  has_many :collaborations, dependent: :destroy

  before_save { self.email = email.downcase if email.present? }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  validates :password, length: { minimum: 6 }, allow_blank: true

  validates :email,
           presence: true,
           uniqueness: { case_sensitive: false },
           length: { minimum: 3, maximum: 254 }

  after_initialize :initialize_role

  enum role: [:standard, :premium, :admin]

  private

  def initialize_role
    self.role ||= :standard
  end
end
