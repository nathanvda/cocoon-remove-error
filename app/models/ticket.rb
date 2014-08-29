class Ticket < ActiveRecord::Base
  belongs_to :customer
end
