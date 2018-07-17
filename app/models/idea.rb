class Idea < ApplicationRecord
  belongs_to :use
   has_many :reviews, dependent: :destroy

    
  validates(:title, presence: true, uniqueness: true)

  validates(
      :description,
      presence: true,
      length: {
        minimum: 10,
        maximum: 2048
      }
    )    
end



