class CreatePianizms < ActiveRecord::Migration
  def change
    create_table :pianizms do |t|
      t.timestamps
    end
  end
end
