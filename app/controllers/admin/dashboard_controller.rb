class Admin::DashboardController < ApplicationController
	before_filter :authenticate_user!  
	filter_resource_access
	layout "admin"

	def index
		count_by_user_washes
	end

	def view
	end

	def list
	end

	def count_by_user_washes
		@washes = Wash.select(" count(*) AS washes_count, max(washes.stocked_on) AS latest_stocked_on, washes.*").group(:email).paginate(page: params[:page]).order("washes_count DESC")
		respond_to do |format|
		  format.html # index.html.erb
		  format.json { render json: @washes }
		end
	end

end
