class Furima < ApplicationRecord
  belongs_to :user

  def change
    create_table :furimas do |t|

      t.timestamps
    end
  end
end
