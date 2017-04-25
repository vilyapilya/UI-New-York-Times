class Comment < ApplicationRecord
  validates :content, :post, :author, presence: true


  belongs_to :post,
  primary_key: :id,
  foreign_key: :post_id,
  class_name: :Post

  belongs_to :author,
  primary_key: :id,
  foreign_key: :user_id,
  class_name: :User

  belongs_to :parent,
  optional: true,
  class_name: :Comment

  has_many :children,
  foreign_key: :parent_id,
  class_name: :Comment
end
