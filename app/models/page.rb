class Page < ApplicationRecord
    validates :topic, presence: true
    validates :json_data, presence: true
  
    # You can add relations if needed
end