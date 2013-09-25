class CreateCraques < ActiveRecord::Migration
  def change
    create_table :craques do |t|
      t.string :name
      t.string :nationality

      t.timestamps
    end
  end
end
