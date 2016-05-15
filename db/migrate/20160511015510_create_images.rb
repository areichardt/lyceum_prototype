class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.attachment :src

      t.timestamps null: false
    end
  end
end
