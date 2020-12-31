class CreateFlames < ActiveRecord::Migration[6.0]
  def change
    create_table :flames do |t|
      t.string :yourname
      t.string :crushname
      t.string :result

      t.timestamps
    end
  end
end
