class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.belongs_to :twitter_user
      t.string :text
    end
  end
end
