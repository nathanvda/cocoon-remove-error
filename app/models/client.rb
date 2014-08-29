class Client < ActiveRecord::Base
    has_many :stores
    accepts_nested_attributes_for :stores, :reject_if => :all_blank, :allow_destroy => true
end