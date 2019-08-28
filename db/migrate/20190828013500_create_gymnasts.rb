class CreateGymnasts < ActiveRecord::Migration
  def change
    create_table :gymnasts do |t|
      t.string :name
    end
  end
end
