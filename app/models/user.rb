class User < ActiveRecord::Base
  def self.find_or_create(user_params)
    user = find_by_uid(user_params[:uid])
    return user if user.present?
    create(user_params)
  end
end
