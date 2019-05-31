module ImHungry
  module TzHelper
    def parse_time(time)
      Time.parse("#{time} #{tz_offset}")
    end

    def tz_offset
      timezone = TZInfo::Timezone.get(time_zone)
      offset_in_hours = timezone.current_period.utc_total_offset_rational.numerator
      format('%+.2d:00', offset_in_hours)
    end

    def current_time
      Time.now.getlocal(tz_offset)
    end
  end
end
