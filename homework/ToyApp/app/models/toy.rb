class Toy < ActiveRecord::Base
  validates :name, :toyable_type, :toyable_id, presence: true
  validates :name, uniqueness: {scope: :toyable}

  belongs_to :toyable, polymorphic: :true
  has_many :cats
  has_many :corgis
end
