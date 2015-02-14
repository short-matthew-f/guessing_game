# == Schema Information
#
# Table name: players
#
#  id              :integer          not null, primary key
#  email           :string           not null
#  password_digest :string           not null
#  session_token   :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Player < ActiveRecord::Base
  attr_reader :password

  validates :email, presence: true, uniqueness: true
  # allow nil allows us to validate players during things other
  # than password change, since @password won't be set any other place
  validates :password, length: { minimum: 5, allow_nil: true }

  has_many :games

  # Player.find_by_credentials(email: params[:email], password: params[:password])
  def self.find_by_credentials(args = {})
    player = Player.find_by(email: args[:email])
    return nil unless player

    # if player.is_password?(args[:password])
    #   return player
    # else
    #   return nil
    # end
    return player.is_password?(args[:password]) ? player : nil
  end

  def password=(pwd)
    @password = pwd  # only for validation on pw create or change
    self.password_digest = BCrypt::Password.create(pwd)
  end

  def is_password?(pwd)
    BCrypt::Password.new(self.password_digest).is_password?(pwd)
  end
end
