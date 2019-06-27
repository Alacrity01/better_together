class Request < ApplicationRecord
  belongs_to :requester, class_name: "User"
  belongs_to :requestee, class_name: "User"

  validates :requester_id, uniqueness: {scope: :requestee_id}

  enum status: {pending: 0, confirmed: 1, denied: 2}

  def friendly_updated_at
    self.updated_at.strftime("%A, %d %b %Y %l:%M %p")
  end

end
