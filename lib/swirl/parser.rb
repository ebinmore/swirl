module Swirl
  class NoAffiliateDatabaseError < StandardError; end

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
      # 1) let's ensure that there's a CashWord object, otherwise raise an exception
      raise NoAffiliateDatabaseError unless @cash_words


      # 2) go through all the tokens in @html and see if they exist in @cash_words
      monetized_html = @html.split(/\s/).each do |token|
        output = ""
        if @cash_words.has_word?(token)
          # a) the token is a word in our affiliate database, so let's make some $$$!
            # 3) get the corresponding URI from @cash_words
            uri = @cash_words.get_links_for_word(token)
            link = "<a href=""#{uri.first}"">#{token}</a>"
            # 4) append the URI and token to the output as a link
            output << link << " "
        else
          # b) no $$$ :-(
            # 5) append the token to the revised output
          output << token << " "
        end
        output
      end

      # 6) return the monetized html and make $$$!
      monetized_html
    end

  end
end
