class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.references :player
      t.string :color, null: false
      t.string :guess
      t.boolean :won

      t.timestamps null: false
    end
  end
end
