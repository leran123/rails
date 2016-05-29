class Event < ActiveRecord::Base
  validates_presence_of :name
  has_many :attendees # many
  belongs_to :category
  has_one :location # single
end
