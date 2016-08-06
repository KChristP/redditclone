class PostSub < ActiveRecord::Base
  validates :post_id, uniqueness: { scope: :sub_id }
  validates :post_id, :sub_id, presence: true

  belongs_to :post

  belongs_to :sub
end
