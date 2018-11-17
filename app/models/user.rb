class User < ApplicationRecord
    has_many :seller_listings, class_name: "Listing", foreign_key: "seller_id"
    has_secure_password
    validates_uniqueness_of :username
    validates :username, presence: true
    validates :email, presence: true
    has_one :watchlist
end
