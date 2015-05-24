class Post < ActiveRecord::Base
  # belongs_to :user
  validates :title, length: { in: 1..100 },
                    presence: true
  validates :content, presence: true
  validates :phone, length: { is: 10, allow_blank: true },
                    presence: false

end
