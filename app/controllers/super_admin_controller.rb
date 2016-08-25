class SuperAdminController < ApplicationController
	layout 'super_admin'
	add_flash_types :error, :info
	before_action :authenticate_user!
end
