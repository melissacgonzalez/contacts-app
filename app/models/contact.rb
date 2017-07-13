class Contact < ApplicationRecord
  def last_update
    updated_at.strftime("%B %e, %Y")
  end

  def full_name
    first_name + " " + last_name
  end
end
