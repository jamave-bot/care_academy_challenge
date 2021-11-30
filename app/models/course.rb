class Course < ApplicationRecord
    validates :name, :release_date, presence: true;
end
