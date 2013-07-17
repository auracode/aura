class Task < ActiveRecord::Base
  attr_accessible :name, :published_on, :title
end
