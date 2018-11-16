class UnidadeMedida < ApplicationRecord
  validates_presence_of :nome, :sigla
end
