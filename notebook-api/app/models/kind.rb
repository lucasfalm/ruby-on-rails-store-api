class Kind < ApplicationRecord
    validates :description, presence: true
    has_many :contacts
end
