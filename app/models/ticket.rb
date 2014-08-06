class Ticket < ActiveRecord::Base
  validates_presence_of :issue_status, :issue_type, :user_id, :name, :comment, :project_id

  belongs_to :project
  belongs_to :user
  belongs_to :issue_type
  belongs_to :issue_status

  def self.search(query)
    # where(:title, query) -> This would return an exact match of the query
    where("tickets.name ILIKE ? OR tickets.comment ILIKE ?", "%#{query}%","%#{query}%")
  end
end
