class User < ApplicationRecord
    has_secure_password
    validates :email_address, presence: true, uniqueness: true
    validates :password, length: { minimum: 6 }

    belongs_to :organisation, optional: true
    has_many :shifts
end
