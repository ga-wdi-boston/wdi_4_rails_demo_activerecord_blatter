class CreateBlats < ActiveRecord::Migration
  def change
    create_table :blats do |t|
      t.text :title
      t.text :body

      t.timestamps
    end
  end
end
