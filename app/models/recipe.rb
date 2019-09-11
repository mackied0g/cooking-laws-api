class Recipe < ApplicationRecord
    has_many :comments
    belongs_to :law
end
