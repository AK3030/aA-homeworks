# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string
#  password_digest :string
#  session_token   :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
  validates :username, :session_token, presence: true
  validates :password_digest, presence: {message: "Password can't be blank"}
  validates :password, length: {minimum: 6, allow_nil: true}
  before_validation :ensure_session_token

  attr_accessor :password

  def self.find_by_credentials(username, password)
    temp = User.find_by(username: username)
    return temp if BCrypt::Password.new(temp.password_digest).is_password?(password)
    nil
  end

  def reset_session_token!
    self.session_token = generate_session_token
    self.save!
    self.session_token
  end

  def generate_session_token
    SecureRandom::urlsafe_base64
  end

  def ensure_session_token
    if self.session_token
      return
    else
      self.reset_session_token!
    end
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(@password)
  end
end
