class Idea < ApplicationRecord

    validates(:title, presence: true, uniqueness: true)

    validates(
        :description,
        presence: {
            message: "Obrigatory field"
        },
        length: {
            minimum:10, 
            maximum:300
        }
    )
end