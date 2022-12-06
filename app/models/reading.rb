class Reading < ApplicationRecord
  has_one_attached :csv_file
  has_many :reports 
end
