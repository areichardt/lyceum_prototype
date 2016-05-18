class CreateTubes < ActiveRecord::Migration
  def change
    create_table :tubes do |t|
      t.string :url

      t.timestamps null: false
    end
  end
end
