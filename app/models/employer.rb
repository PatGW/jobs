class Employer < User #ActiveRecord::Base
  attr_accessible :location, :logo, :name

  has_one :user, :as => :role

end
