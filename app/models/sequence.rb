class Sequence < ActiveRecord::Base
  belongs_to :assembly
  has_many :genes
  belongs_to :assembly
  validates :assembly_id, presence: true
end
