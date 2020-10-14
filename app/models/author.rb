# Author
#   is valid
#   is invalid with no name
#   is invalid with a short number
#   is invalid when non-unique
class Author < ActiveRecord::Base
    validates(:name,  presence: true, uniqueness: true) 
    validates(:phone_number, { length: {minimum: 10}})
end
