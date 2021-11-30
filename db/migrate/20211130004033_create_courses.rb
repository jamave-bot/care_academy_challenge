class CreateCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :courses do |t|
      t.string :name
      t.datetime :release_date

      t.timestamps
    end
  end
end
