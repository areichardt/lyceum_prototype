class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.attachment :epub

      t.timestamps null: false
    end
  end
end
