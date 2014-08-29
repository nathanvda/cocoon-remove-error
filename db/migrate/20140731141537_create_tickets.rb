class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :description
      t.references :customer, index: true
      t.integer :status
      t.datetime :started_on
      t.datetime :completed_on
      t.integer :priority
      t.integer :type

      t.timestamps
    end
  end
end
