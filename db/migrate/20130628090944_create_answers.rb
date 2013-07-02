class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.references :user
      t.references :survey
      t.references :option
      t.timestamps
    end
  end
end
