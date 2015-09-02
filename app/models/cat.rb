class Cat < ActiveRecord::Base
  belongs_to :owners

  def full_details(show_all = true)
    "#{self.name} and #{self.age}"
  end

  def i
    "#{self.owners.name} , #{self.owner.age}"
  end
end
