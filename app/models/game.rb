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


  belongs_to :player
end
