class Post < ActiveRecord::Base
  validates :url, :title, :content, :author_id, presence: true
  validates :url, :title, uniqueness: true
  validate :sub_exists

  # belongs_to :sub,
  #   primary_key: :id,
  #   foreign_key: :sub_id,
  #   class_name: :Sub

  has_many :comments

  has_many :post_subs

  has_many :subs,
    through: :post_subs,
    source: :sub

  belongs_to :author,
    primary_key: :id,
    foreign_key: :author_id,
    class_name: :User


  def sub_exists
    unless PostSub.where(post_id: self.id).count > 0
      errors.add(errors: "sub doesnt exist")
    end
  end


end
