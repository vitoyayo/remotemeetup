ActiveAdmin.register_page 'Dashboard' do
  menu priority: 1, label: proc { I18n.t('active_admin.dashboard') }

  content title: proc { I18n.t('active_admin.dashboard') } do
    columns do
      column do
        panel 'Meetups' do
          ul do
            Meetup.all.limit(5).each do |meetup|
              li link_to(meetup.title, admin_meetup_path(meetup))
            end
          end
        end
      end

      column do
        panel 'Events' do
          ul do
            Event.all.limit(5).each do |event|
              li link_to(event.name, admin_event_path(event))
            end
          end
        end
      end
    end
  end
end
