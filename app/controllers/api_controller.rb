class ApiController < ApplicationController
  include TokenAuth
  respond_to :json
end
