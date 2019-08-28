class CreateGymnasts < ActiveRecord::Migration
  def change
    create_table :gymnasts do |t|
      t.string :name
      t.integer :gym_id
    end
  end
end
