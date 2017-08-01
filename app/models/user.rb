class User < ApplicationRecord
  has_secure_password
  has_many :contacts

  def contact_group_names
    group_names = {}
    self.contacts.each do |contact|
      contact.groups.each do |group|
        group_names[group.name] ||= true
      end
    end
    return group_names.keys.sort
  end

end
