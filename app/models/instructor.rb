class Instructor < ApplicationRecord
  has_secure_password
  before_save :encrypt_password

  has_many :courses
  has_many :students
  has_many :tasks

  validates :name, :email, :password_digest, presence: true, length: { maximum: 255 }
  validates :email, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'must be a valid email address' }
  validates :status, inclusion: { in: %w( ativo ferias contrato_de_trabalho_suspenso aviso_previo previdencia licenca_maternidade ) }

  def encrypt_password
    self.password_digest = BCrypt::Password.create(password_digest)
  end

  def self.authenticate(email, password)
    instructor = Instructor.find_by(email: email)
    my_password = BCrypt::Password.new(instructor&.password_digest)
    return instructor if my_password == password
  end
end
