class ApplicationController < ActionController::Base
  def index
    render inline: '', layout: 'application' # Avoid having an empty view file.
  end
end
