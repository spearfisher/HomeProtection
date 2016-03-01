class User < ActiveRecord::Base
  has_many :raspberries
  def self.find_or_create(user_params)
    user = find_by_uid(user_params[:uid])
    return user if user.present?
    create(user_params)
  end
end
