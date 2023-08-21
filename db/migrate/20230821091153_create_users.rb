class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|

      t.string  :user_name, limit: 20, null: false
      t.boolean :locked, null: false, default: false

      t.timestamps
    end
  end
end
