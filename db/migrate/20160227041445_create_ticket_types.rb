class CreateTicketTypes < ActiveRecord::Migration
  def change
    create_table :ticket_types do |t|
      t.string :name
      t.references :event, index: true, foreign_key: true
      t.text :zpl

      t.timestamps null: false
    end
  end
end
