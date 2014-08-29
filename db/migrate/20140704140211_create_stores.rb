class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.references :client, index: true
      t.string :name
      t.string :name2
      t.string :district
      t.string :address
      t.integer :number
      t.string :complement
      t.string :cnpj
      t.references :city, index: true
      t.string :mail
      t.text :obs
      t.integer :status
      t.string :phone
      t.string :phone2
      t.string :phone3
      t.string :sversion
      t.timestamps
    end
  end
end
