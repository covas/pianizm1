class CreateHistorics < ActiveRecord::Migration
  def change
    create_table :historics do |t|

      t.timestamps
    end
  end
end
