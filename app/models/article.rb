class Article < ActiveRecord::Base
has_many :comments, dependent: :destroy
has_many :images, :as => :imagable
 validates :name, presence: true
  accepts_nested_attributes_for :images, :allow_destroy => true, :reject_if=>:all_blank
 def self.search(search)
    if search.present?
     where('name LIKE ? ',"#{search}")
    else
      all
    end
  end
end
