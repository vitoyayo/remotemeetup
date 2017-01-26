class MeetupsController < ApplicationController
  def index
    @meetups = Meetup.all
  end

  def show
    @meetup = Meetup.find_by(slug: params[:slug])
  end
end
