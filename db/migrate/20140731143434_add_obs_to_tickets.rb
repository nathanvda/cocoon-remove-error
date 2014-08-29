class AddObsToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :obs, :string
  end
end
