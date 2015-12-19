class User < ActiveRecord::Base
  after_initialize :set_role
  has_secure_password

  has_many :cues

  validates :nickname, :gender, :email, :role, presence: true
  validates :nickname, :email, uniqueness: true
  validates :nickname, length: {maximum: 14}
  validates :gender, inclusion: { in: %w(male female), message: "%{value} is not a valid option" }
  validates :role, inclusion: { in: %w(user ads admin)}

private

  def set_role
    self.role ||= 'user'
  end
  
end
