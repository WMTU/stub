class RemoveTypeFromTicket < ActiveRecord::Migration
  def change
    remove_column :tickets, :type
  end
end
