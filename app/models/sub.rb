class Sub < ActiveRecord::Base
  validates :title, :description, :mod_id, presence: true
  validates :title, uniqueness: true

  belongs_to :mod,
    primary_key: :id,
    foreign_key: :mod_id,
    class_name: :User

  has_many :post_subs

  has_many :posts,
    through: :post_subs,
    source: :post

  # has_many :posts,
  #   foreign_key: :sub_id,
  #   primary_key: :id,
  #   class_name: :Post


end
