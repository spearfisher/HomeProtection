class ClimateLogsController < ApplicationController
  skip_before_action :verify_authenticity_token, :require_user

  def create
    climate_log = ClimateLog.new(climate_log_params)
    if climate_log.save
      head 200, content_type: 'text/html'
    else
      head 500, content_type: 'text/html'
    end
  end

  private

  def climate_log_params
    JSON.parse(params[:climate_log])
  end
end
