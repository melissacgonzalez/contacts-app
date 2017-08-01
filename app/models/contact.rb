class Contact < ApplicationRecord
  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true

  belongs_to :user
  has_many :contact_groups
  has_many :groups, through: :contact_groups
  
  def last_update
    updated_at.strftime("%B %e, %Y")
  end

  def full_name
    "#{last_name}, #{first_name}"
  end

  def japan_phone_number
    "+81 #{phone_number}"
  end
end
