class User < ActiveRecord::Base
  validates :user_name, :password_digest, presence: true
  validates :session_token, presence: true, uniqueness: true
  before_validation: :ensure_session_token

  def self.user_reset_session_token!
    self.session_token = SecureRandom::urlsafe_base64(16)
  end

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    return true if BCrypt::Password.create(password) == self.password_digest
  end

  def find_by_credentials(user_name, password)
    u = User.find_by(user_name: user_name)
    if u &&  BCrypt::Password.create(password) == u.password_digest
      return u
    end
    nil
  end
end
