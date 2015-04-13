class ApiController < ActionController::Base
  include TokenAuth
  respond_to :json
end
