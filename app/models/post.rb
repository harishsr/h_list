class Post < ActiveRecord::Base
  # belongs_to :user
  validates :title, length: { in: 1..100 },
                    presence: true
  validates :content, presence: true
  validates :phone, length: { is: 10 },
                    presence: false
  validates_numericality_of :phone, in: (1..10)

end
