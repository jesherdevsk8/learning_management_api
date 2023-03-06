class Student < ApplicationRecord
  has_secure_password
  before_save :encrypt_password

  has_many :courses
  has_many :instructors
  has_many :tasks

  validates :name, :email, :password_digest, presence: true, length: { maximum: 255 }
  validates :email, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'must be a valid email address' }

  def encrypt_password
    self.password_digest = BCrypt::Password.create(password_digest)
  end

  def self.authenticate(email, password)
    student = Student.find_by(email: email)
    my_password = BCrypt::Password.new(student&.password_digest)
    return student if my_password == password
  end
end
