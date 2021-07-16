require 'slack-notifier'

class Intervention < ApplicationRecord

    include ActiveModel::Dirty
    before_update :slack_notify

    def slack_notify
        if self.status_was != self.status
            notifier = Slack::Notifier.new ENV["SLACK_APIKEY_2"]
            notifier.ping "Author is employee number: #{self.author} The customer is #{self.customer_id}. The Building ID is: #{self.building_id}. The Battery ID is: #{self.battery_id}. The Column ID is #{self.column_id}. The Elevator ID is #{self.elevator_id}. The Employee to be assign to this task is employee number: #{self.employee_id}. Here is a quick description : #{self.report}."
        end
    end



end
