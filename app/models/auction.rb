class Auction < ApplicationRecord
    
    enum status: { opening: 0, aucting: 1, closed: 2 }
    # belongs_to :owner, class_name: 'User'
    belongs_to :winner, class_name: 'User', optional: true
    belongs_to :product

    validates :winner, presence: true, allow_nil: true
    validates :product, presence: true, allow_nil: false

    def time_auction
        now = Time.zone.now
        days = (started_at - now).to_i / (60 * 60 * 24)
        hours = (started_at - (now + days.days)).to_i / ( 60 * 60)
        minutes = (started_at - (now + days.days + hours.hours)).to_i / ( 60 )
        seconds = (started_at - (now + days.days + hours.hours + minutes.minutes)).to_i
        time_str = ""
        time_str = "#{days}d " if days > 0
        time_str = "#{time_str}#{hours}h " if hours > 0
        time_str = "#{time_str}#{minutes}m " if minutes > 0
        time_str = "#{time_str}#{seconds}s" if seconds > 0
        time_str
    end
    def hour_auction
        now = Time.zone.now
        (started_at - now).to_i / ( 60 * 60)
    end
end