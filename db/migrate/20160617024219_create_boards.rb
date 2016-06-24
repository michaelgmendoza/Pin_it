class CreateBoards < ActiveRecord::Migration
  def change
    create_table :boards do |t|
      t.string :board_name
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
