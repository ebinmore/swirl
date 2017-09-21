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
      # 1) return the original html if no affiliate database is defined
      return @html unless @cash_words

      puts "original_html = #{@html}"
      # 2) go through all the tokens in @html and see if they exist in @cash_words
      monetized_html = ""
      @html.split(/(\s|\W)/).each do |token|
        puts "token = #{token}"
        if @cash_words.has_word?(token.downcase)
          # a) the token is a word in our affiliate database, so let's make some $$$!
          links = @cash_words.get_links_for_word(token.downcase)
          puts "links = #{links}"
          monetized_html << "<a href=\"#{links.first[:url]}\">#{token}</a>"
        else
          # b) no $$$ :-(
          monetized_html << token
        end
        puts "output = #{monetized_html}"
      end

      puts "monetized_html = #{monetized_html}"
      # 3) return the monetized html and make $$$!
      monetized_html
    end

  end
end
