class Produto < ApplicationRecord
  validates_presence_of :nome
  validates_length_of :bio, maximum: 100, allow_blank: false
end
