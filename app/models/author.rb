class Author < ApplicationRecord
    has_many :books, through: :authorships
end
