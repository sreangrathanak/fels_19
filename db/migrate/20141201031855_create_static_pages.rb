class CreateStaticPages < ActiveRecord::Migration
  def change
    create_table :static_pages do |t|
      t.string :help
      t.string :about
      t.string :contact

      t.timestamps
    end
  end
end
