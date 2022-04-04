class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :postal_code
      t.string :state
      t.string :city
      t.string :neighborhood
      t.string :street
      t.string :number
      t.string :complement
      t.references :patient
      t.timestamps
    end
  end
end
