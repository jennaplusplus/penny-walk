class Trip < ActiveRecord::Base
  belongs_to :walker
  has_many :turns
end
