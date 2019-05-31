module ImHungry
  class CLI
    NUM_PER_PAGE = 10
    URL = 'http://data.sfgov.org/resource/bbb8-hzi6.json'.freeze

    def self.start
      food_trucks = fetch_im_hungry
      filter_food_trucks!(food_trucks)
      sort_food_trucks!(food_trucks)
      print(food_trucks)
      exit
    end

    def self.fetch_im_hungry
      ImHungry::FetchJson.fetch(URL, ImHungry::FoodTruck)
    end

    def self.filter_food_trucks!(food_trucks)
      food_trucks.select!(&:currently_open?)
    end

    def self.sort_food_trucks!(food_trucks)
      food_trucks.sort_by!(&:applicant)
    end

    def self.print(food_trucks)
      ImHungry::Paginate.new(food_trucks, NUM_PER_PAGE).print
    end
  end
end
