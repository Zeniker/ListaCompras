class Funcao < ApplicationRecord
has_and_belongs_to_many :usuarios, :join_table => :usuarios_funcaos


belongs_to :resource,
           :polymorphic => true,
           :optional => true


validates :resource_type,
          :inclusion => { :in => Rolify.resource_types },
          :allow_nil => true

scopify
end
