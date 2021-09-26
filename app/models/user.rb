class User < ApplicationRecord
    has_many :owners, foreign_key: 'owner_id', class_name: 'Product', dependent: :destroy
    has_many :winners, foreign_key: 'winner_id', class_name: 'Auction', dependent: :nullify
end
