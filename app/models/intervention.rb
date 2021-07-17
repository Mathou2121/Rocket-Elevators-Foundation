require 'slack-notifier'

class Intervention < ApplicationRecord
    include ActiveModel::Dirty
    before_update :slack_notify
    before_create :slack_notify

    def slack_notify
        # for the memes
        if self.status_was != self.status || self.author_was != self.author || self.customer_id_was != self.customer_id || self.building_id_was != self.building_id || self.battery_id_was != self.battery_id || self.column_id_was != self.column_id || self.elevator_id_was != self.elevator_id || self.employee_id_was != self.employee_id ||  self.startdate_was != self.startdate || self.enddate_was != self.enddate || self.result_was != self.result || self.report_was != self.report
            notifier = Slack::Notifier.new ENV["SLACK_APIKEY_2"]
            notifier.ping "Author is employee number: #{self.author} The customer is #{self.customer_id}. The Building ID is: #{self.building_id}. The Battery ID is: #{self.battery_id}. The Column ID is #{self.column_id}. The Elevator ID is #{self.elevator_id}. The Employee to be assign to this task is employee number: #{self.employee_id}. Here is a quick description : #{self.report}."
        end
    end
end
