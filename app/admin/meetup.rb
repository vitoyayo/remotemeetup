ActiveAdmin.register Meetup do
  permit_params :title, :description, :organizers
end
