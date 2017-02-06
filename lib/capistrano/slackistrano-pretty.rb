module Slackistrano
  class Pretty < Messaging::Base

    # Send failed message to #ops. Send all other messages to default channels.
    # The #ops channel must exist prior.
    # def channels_for(action)
    #   if action == :failed
    #     "#ops"
    #   else
    #     super
    #   end
    # end

    # Suppress updating message.
    def payload_for_updating
      nil
    end

    # Suppress reverting message.
    def payload_for_reverting
      nil
    end

    # Fancy updated message.
    # See https://api.slack.com/docs/message-attachments
    def payload_for_updated
      emoji = if stage == :production
        ':computer:'
      else
        ':hammer_and_wrench:'
      end
      whichbranch = if branch
        "branch *#{branch}* "
      end

      {
        attachments: [
          {
            color: 'good',
            title: 'Integrations Application Deployed :boom::bangbang:',
            text: "#{emoji} #{ENV['USER']} deployed #{whichbranch}to *#{stage}* (in #{elapsed_time})"
          }
        ]
      }
      # {
      #   attachments: [
      #     {
      #       color: 'good',
      #       title: 'Integrations Application Deployed :boom::bangbang:',
      #       fields: [
      #         {
      #           title: ':computer: Environment',
      #           value: "#{stage}",
      #           short: true
      #         }, {
      #           title: ':gear: Branch',
      #           value: "#{branch}",
      #           short: true
      #         }, {
      #           title: ':bust_in_silhouette: Deployer',
      #           value: "#{ENV['USER']}",
      #           short: true
      #         }, {
      #           title: ':clock2: Time',
      #           value: "#{elapsed_time}",
      #           short: true
      #         }
      #       ],
      #       fallback: ""
      #     }
      #   ]
      # }
    end

    # Default reverted message.  Alternatively simply do not redefine this
    # method.
    def payload_for_reverted
      payload = super
      payload[:text] = ":leftwards_arrow_with_hook: #{payload[:text]} (in #{elapsed_time})"
      payload
    end

    # Slightly tweaked failed message.
    # See https://api.slack.com/docs/message-formatting
    def payload_for_failed
      payload = super
      payload[:text] = ":skull_and_crossbones: #{payload[:text]} (in #{elapsed_time})"
      payload
    end

  end
end
