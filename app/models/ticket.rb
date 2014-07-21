class Ticket < ActiveRecord::Base
  validates_presence_of :name, :comment

  belongs_to :project
  belongs_to :user
  belongs_to :issue_type
  belongs_to :issue_status
end
