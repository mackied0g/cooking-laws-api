class Recipe < ApplicationRecord
    belongs_to :law
    has_many :favorites
    has_many :users, through: :favorites
end
