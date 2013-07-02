class CreateInstances < ActiveRecord::Migration
  def change
    create_table :instances do |t|
      t.string :course
      t.string :instructor
      t.boolean :terms

      t.timestamps
    end
  end
end
