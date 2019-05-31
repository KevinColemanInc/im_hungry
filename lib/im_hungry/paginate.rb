module ImHungry
  class Paginate
    attr_accessor :array, :per_page

    def initialize(array, per_page)
      self.array = array
      self.per_page = per_page
    end

    def pages
      @pages ||= array.each_slice(per_page).to_a
    end

    def page_lines(page, i)
      [
        '',
        "Page #{i + 1} of #{pages.length}",
        page.map(&:to_s)
      ]
    end

    def print_page(page, i)
      puts page_lines(page, i)
    end

    def print
      puts
      puts 'Here is what is open:'
      pages.each_with_index do |page, i|
        print_page(page, i)

        last_page = i == pages.length - 1
        Readline.readline('Next page?', true) unless last_page
      end
    end
  end
end
