class Ancestry < ActiveRecord::Base
  belongs_to :ancestor, :class_name => Comment
  belongs_to :descendant, :class_name => Comment
  # attr_accessible :title, :body
end
