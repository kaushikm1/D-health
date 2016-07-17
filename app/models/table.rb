class Table < ActiveRecord::Base
  validates :time, presence: true
  validates :count, presence: true
  
  
end