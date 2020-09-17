class Purchase < ApplicationRecord
  has_one :delivery

  with_options presence: true do
    validates :user_id
    validates :item_id
  end
end
