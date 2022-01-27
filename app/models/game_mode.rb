class GameMode < ApplicationRecord
    validates :name, presence: true
end
