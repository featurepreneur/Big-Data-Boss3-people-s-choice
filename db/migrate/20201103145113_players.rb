class Players < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|

      t.string :name
      t.bigint :votes
      t.bigint :phone_number
      t.timestamps
    end
  end
end
