
class UsersController < ApplicationController
	def show 
    @user = User.find(params[:id])
  	end
	
	def edit
	@user = User.find(params[:id])
  	end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(the_user_params)
      redirect_to @user

    else
      render 'edit'
    end
  end




	private

	def the_user_params
		params.require(:user).permit(:first_name, :last_name, :email, :avatar)
	end


 end



#    def user_from_params
#     byebug
#     email = user_params.delete(:email)
#     password = user_params.delete(:password)
#     first_name = user_params.delete(:first_name)
#    #  last_name = user_params.delete(:last_name)
#    # birthday = user_params.delete(:birthday)
#       Clearance.configuration.user_model.new(user_params).tap do |user|
#         user.email = email
#           user.password = password
#             user.first_name = first_name
#             # user.last_name = last_name
#             # user.date_of_birth = date_of_birth
#             # user.subscribe = subscribe
#        end
#     # params.require(:user).permit(:email, :password, :first_name)
#     end
  
#   def create
#     @user = User.new(user_from_params)
#     byebug
#     if @user.save
#       sign_in @user
#       redirect_back_or url_after_create
#     else
#       render template: "users/new"
#     end
#   end




#   #   def user_params
#   #      param.require(:user).permit(:email, :first_name, :password)
#   # end



#   end


# end

# class Clearance::UsersController < ApplicationController
#  if respond_to?(:before_action)
#    before_action :redirect_signed_in_users, only: [:create, :new]
#    skip_before_action :require_login, only: [:create, :new], raise: false
#    skip_before_action :authorize, only: [:create, :new], raise: false
#  else
#    before_filter :redirect_signed_in_users, only: [:create, :new]
#    skip_before_filter :require_login, only: [:create, :new], raise: false
#    skip_before_filter :authorize, only: [:create, :new], raise: false
#  end

#  def new
#    @user = user_from_params
#    render template: "users/new"
#  end

#  def create
#    @user = user_from_params

#    if @user.save
#      sign_in @user
#      redirect_back_or url_after_create
#    else
#      render template: "users/new"
#    end
#  end

#  private

#  def avoid_sign_in
#    warn "[DEPRECATION] Clearance's `avoid_sign_in` before_filter is " +
#      "deprecated. Use `redirect_signed_in_users` instead. " +
#      "Be sure to update any instances of `skip_before_filter :avoid_sign_in`" +
#      " or `skip_before_action :avoid_sign_in` as well"
#    redirect_signed_in_users
#  end

#  def redirect_signed_in_users
#    if signed_in?
#      redirect_to Clearance.configuration.redirect_url
#    end
#  end

#  def url_after_create
#    Clearance.configuration.redirect_url
#  end

#  def user_from_params

#    email = user_params.delete(:email)
#    password = user_params.delete(:password)
#    first_name = user_params.delete(:first_name)
#    last_name = user_params.delete(:last_name)
#    date_of_birth = user_params.delete(:date_of_birth)
#    subscribe = user_params.delete(:subscribe)

#    Clearance.configuration.user_model.new(user_params).tap do |user|
#      user.email = email
#      user.password = password
#      user.first_name = first_name
#      user.last_name = last_name
#      user.date_of_birth = date_of_birth
#      user.subscribe = subscribe
#    end
#  end

#  # def user_params
#  #   params[Clearance.configuration.user_parameter] || Hash.new
#  # end

#  def user_params
#     params.require(:user).permit(:first_name,:last_name :email, :password, :birthday, :encrypted_password)
#      params[Clearance.configuration.user_parameter] || Hash.new
#   end
# end