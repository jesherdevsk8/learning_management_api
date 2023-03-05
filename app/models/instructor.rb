class Instructor < ApplicationRecord
  has_many :courses

  validates :name, :email, :password, presence: true, length: { minimum: 255 }
  validates :status, inclusion: { in: %w( ativo ferias contrato_de_trabalho_suspenso aviso_previo previdencia licenca_maternidade ) }
end
