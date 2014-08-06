class Project < ActiveRecord::Base
  validates_presence_of :name, :user_id
  has_many :tickets, :dependent => :destroy

  belongs_to :user
end
