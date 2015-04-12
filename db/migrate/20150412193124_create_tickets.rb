class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :hash
      t.string :type

      t.timestamps null: false
    end
  end
end
