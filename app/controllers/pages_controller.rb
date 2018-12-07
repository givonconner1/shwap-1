class PagesController < ApplicationController
  def dashboard
    @availabilities = current_user.availabilities.order(created_at: :desc)
  end
  def schedules
    render template: "pages/#{params[:page]}"
  end
  
  def pending
    @availabilities = Availability.where('status=? OR status=?', 'Pending Swap', 'Confirmed Swap')
  end
end
