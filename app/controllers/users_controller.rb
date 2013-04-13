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
    debugger
     @user = User.new(params[:user])
    if params[:role_type] == "coach"
      role = Employer.create
    else params[:role_type] == "player"
      role = Applicant.create
    # if resource.role_type == "employer" 
    #   role = Employer.create!
    # elsif resource.role_type == "applicant"
    #   role = Applicant.create!


    # else
    # redirect_to(new_user_registration_path) and return
    # no need as it seems devise has a redirect_to method inbuilt. If my own it added 
    # it fails complaining of multiple redirects
    end 
  end


end
