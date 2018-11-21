class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.find_by_as_array(hash, value)
    self.where(hash => value)
  end
end
