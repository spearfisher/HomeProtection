class UsersController < ApplicationController
  expose(:raspberry) { raspberries.first }
  expose(:raspberries) { current_user.raspberries }
  include RpiInfo
  layout 'user'

  def show
    redirect_to raspberries_path unless raspberry
    @stream_token = stream_token if raspberry
  end
end
