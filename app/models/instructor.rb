class Instructor < ApplicationRecord
  has_secure_password

  has_many :courses

  validates :name, :email, :password_digest, presence: true, length: { maximum: 255 }
  validates :status, inclusion: { in: %w( ativo ferias contrato_de_trabalho_suspenso aviso_previo previdencia licenca_maternidade ) }
end
