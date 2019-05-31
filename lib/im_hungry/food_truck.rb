module ImHungry
  class FoodTruck
    include ImHungry::TzHelper
    TZ = 'US/Pacific'

    attr_accessor :start24, :end24, :dayorder, :applicant, :location

    def initialize(food_truck)
      self.start24 = food_truck["start24"]
      self.end24 = food_truck["end24"]
      self.dayorder = food_truck["dayorder"]
      self.applicant = food_truck["applicant"]
      self.location = food_truck["location"]
    end

    def wday
      dayorder&.to_i
    end

    def start_time
      parse_time(start24)
    end

    def end_time
      parse_time(end24)
    end

    def is_current_day_of_week?
      wday == current_time.wday
    end

    def has_started?
      start_time <= current_time
    end

    def has_ended?
      end_time > current_time
    end
    
    def currently_open?
      is_current_day_of_week? && has_started? && has_ended?
    end

    def time_zone
      TZ
    end

    def to_s
      "#{applicant} at #{location}"
    end
  end
end