class Gene < ActiveRecord::Base
  belongs_to :sequence
  has_many :hits, as: :subject
  belongs_to :sequence
  validates :sequence_id, presence: true
end
