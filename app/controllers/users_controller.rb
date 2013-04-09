class UsersController < Devise::RegistrationsController

  def new
    super
  end

  def create
    User.transaction do
      super
      after_sign_in_path(resource)
    end
  end

  private

  def after_sign_in_path(resource)
    if resource.role_type == "employer" 
      role = Employer.create!
    elsif resource.role_type == "applicant"
      role = Applicant.create!
    else
      redirect_to(new_user_registration_path) and return
    end 
  end


end
