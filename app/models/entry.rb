class Entry < ApplicationRecord
  STATUS = ["active", "non-active"]
  belongs_to :group

  scope :search_in_multiple_tables, ->(q) {
    title_contains(q).group_title_contains(q)
  }

  scope :title_contains, ->(q) {
    where("entries.title LIKE ?", "%#{q}%")    
  }

  scope :group_title_contains, ->(q) {
    joins(:group).where("groups.title LIKE ?", "%#{q}%")    
  }
end