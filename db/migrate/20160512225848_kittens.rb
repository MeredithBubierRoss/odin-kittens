class Kittens < ActiveRecord::Migration
  def change
    create_table :kittens do |t|
      t.string :name
      t.string :age
      t.string :cuteness
      t.string :softness
    end
  end
end
