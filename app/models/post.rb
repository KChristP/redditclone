class Post < ActiveRecord::Base
  validates :url, :title, :content, :sub_id, :author_id, presence: true
  validates :url, :title, uniqueness: true

  belongs_to :sub,
    primary_key: :id,
    foreign_key: :sub_id,
    class_name: :Sub

  belongs_to :author,
    primary_key: :id,
    foreign_key: :author_id,
    class_name: :User


end
