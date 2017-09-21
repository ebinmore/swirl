module Swirl
  class Parser

    def initialize
      @html = nil
      @cash_words = nil
    end

    def add_html(html)
      @html = html
    end

    def use_affiliate_database(cash_words)
      @cash_words = cash_words
    end

    def money_making_html
      # do some magic here
    end

  end
end
