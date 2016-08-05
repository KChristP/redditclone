class User < ActiveRecord::Base
  attr_reader :password
  after_initialize :ensure_session_token
  validates :username, :password_digest, :session_token, presence: true
  validates :password, length: {minimum: 6, allow_nil?: true}

  has_many :posts,
    foreign_key: :author_id,
    primary_key: :id,
    class_name: "Post"

  has_many :subs,
    foreign_key: :mod_id,
    primary_key: :id,
    class_name: :Sub


  def ensure_session_token
    self.session_token ||= SecureRandom::urlsafe_base64(32)
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.find_by_credentials(username, password)
    maybe_user = User.find_by(username: username)
    if maybe_user.nil?
      return nil
    end
    if maybe_user.is_password?(password)
      maybe_user
    else
      nil
    end
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def reset_session_token!
    self.session_token = SecureRandom::urlsafe_base64(32)
    self.save
    self.session_token
  end

end
