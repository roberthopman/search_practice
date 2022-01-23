class CreateEntries < ActiveRecord::Migration[7.0]
  def change
    create_table :entries do |t|
      t.string :title
      t.date :expiration_date
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
