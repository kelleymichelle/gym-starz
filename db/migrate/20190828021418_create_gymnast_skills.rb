class CreateGymnastSkills < ActiveRecord::Migration
  def change
    create_table :gymnast_skills do |t|
      t.integer :gymnast_id
      t.integer :skill_id
    end
  end
end
