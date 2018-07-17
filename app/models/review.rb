class Review < ApplicationRecord
  belongs_to :idea
  belongs_to :use


  validates :body, presence: true
  
end
