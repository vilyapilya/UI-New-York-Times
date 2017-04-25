class Post < ApplicationRecord
  validates :title, :author, presence: true

  belongs_to :author,
  primary_key: :id,
  foreign_key: :user_id,
  class_name: :User

  # belongs_to :sub,
  # primary_key: :id,
  # foreign_key: :sub_id,
  # class_name: :Sub

  has_many :post_subs,
  inverse_of: :post,
  primary_key: :id,
  foreign_key: :post_id,
  class_name: :PostSub

  has_many :subs,
  through: :post_subs,
  source: :sub

  has_many :comments



end
