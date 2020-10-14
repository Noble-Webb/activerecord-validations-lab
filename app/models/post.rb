# Post
#   is valid
#   is invalid without a title
#   is invalid with too short content
#   is invalid with a long summary
#   is invalid with a category outside the choices
#   is invalid if not clickbait

class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
    validate :is_clickbait?
  
    CLICKBAIT_PATTERNS = [
      /Won't Believe/,
      /Secret/,
      /Top [0-9]*/,
      /Guess/
    ]
  
    def is_clickbait?
      if CLICKBAIT_PATTERNS.none? { |pat| pat.match title }
        errors.add(:title, "must be clickbait")
      end
    end
end