

class User < ActiveRecord::Base
  has_many :movies

  validates :email, :username, :password_hash, presence: true

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def authenticate(pw_input)
    self.password == pw_input
  end
end
