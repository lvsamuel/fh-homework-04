class Book < ApplicationRecord
    has_many :authors, through: :authorships
    paginates_per 25
end
