class Produto < ApplicationRecord
  validates_presence_of :nome, :tipo
  validates_length_of :nome, maximum: 100, allow_blank: false

  def concat_nome_tipo
    "#{nome} - #{tipo}"
  end
end
