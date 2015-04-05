class CreateDonnees < ActiveRecord::Migration
  def change
  	create_table :donnees do |t|
  		t.string :todo
  		t.string :date
  	end
  end
end
