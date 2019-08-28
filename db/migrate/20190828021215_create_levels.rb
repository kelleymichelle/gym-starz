class CreateLevels < ActiveRecord::Migration
  def change
    create_table :levels do |t|
     t.integer :gym_level
      
    end
  end
end
