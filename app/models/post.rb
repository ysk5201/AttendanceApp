class Post < ApplicationRecord
    validates :employee_id, presence: true
    validates :status, presence: true
end
