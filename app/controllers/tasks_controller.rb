class TasksController < ApplicationController

 
    #### send notification function ####
    def self.send_notification(receiver_user ,body , click_action)
        @serverkey  = "key=AAAAq-c6jdw:APA91bGwWnR9kGSuysCBBj_t0Il2Ka8V6OfnRL3wa7iM8OfoS6ACFKwWdnnre03fbvVikSh-U0AE60pT0wckepDIvzZZc_5owF9ZUarxfJP-0jw9p2eVUzMvfuSxFX9D6G_IsR8svcTu"
        @serverurl = "http://localhost:3000"
        #### Sender User ####

        icon=@serverurl + "/uploads/logo.png"

        #### get all tokens of the recevier user ####
        user_notification_tokens = receiver_user.notification_tokens        

        #### Send notification to all the user's browsers ####
        user_notification_tokens.each do |user_notification_token|
        JSON.load `curl https://fcm.googleapis.com/fcm/send \
        -H "Content-Type: application/json" \
        -H 'Authorization: #{@serverkey} ' \
        -d '{ "notification": {"title": "Shelves", "body": "#{body}", "icon": "#{icon}" "click_action" : "#{click_action}"}, "to" : "#{user_notification_token.token}" }'`
        end

        #### save notification message in database ####
        @notification_message=NotificationMessage.new({
            "body" => body,
            "icon" => icon,
            "click_action" => click_action,
            "receiver_user" =>  receiver_user.id,
            
        })
        if @notification_message.save
            puts "Notification message saved successfully"
        end
        
    end

end