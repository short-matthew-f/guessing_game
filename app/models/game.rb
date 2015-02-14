# == Schema Information
#
# Table name: games
#
#  id         :integer          not null, primary key
#  player_id  :integer
#  color      :string           not null
#  guess      :string
#  won        :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Game < ActiveRecord::Base
  validates :color, inclusion: { in: ['red', 'green', 'blue'] }

  belongs_to :player

  def self.random_color
    Game.colors.sample
  end

  def self.colors
    ['red', 'green', 'blue']
  end

  def to_s
    "Your guess: " + guess + ", Hidden color: " + color
  end
end
