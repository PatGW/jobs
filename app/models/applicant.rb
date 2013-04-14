class Applicant < User #ActiveRecord::Base
  attr_accessible :cv, :experience, :first_name, :postcode, :second_name

  has_one :user, :as => :role
end
