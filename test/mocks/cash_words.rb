# Boss, I wrote a mocking library to make sure we are selecting the
# highest amount from our affiliates
class CashWords

  def initialize
    @words = {}
    @words["cheese"] = [
        { url: 'https://cheapo.com/food', amount: 0.001 },
        { url: 'https://bigmoney.com/rottenstuff', amount: 0.02 }
      ]
    @words["kale"] = [
        { url: 'https://bigstore.com/produce/kale?partner=smooth', amount: 0.03 },
        { url: 'https://largerstore.com/wiltedStuff/kale?partner=smooth', amount: 0.04 },
        { url: 'https://garden.org/fresh/kale?partner=smooth', amount: 0.02 }
      ]
  end

  # Check to see if this word is in the database
  # Returns true or false
  def has_word?(word)
    @words.keys.include?(word)
  end

  # Performs a look up on the word, and returns an array
  # of hashes with keys: amount, url
  #   db.get_links_for_word('kale')
  #   > [
  #      {:amount => 0.03,
  #       :url => 'https://bigstore.com/produce/kale?partner=smooth'
  #      },
  #      {:amount => 0.04,
  #       :url => 'https://largerstore.com/wiltedStuff/kale?partner=smooth'
  #      },
  #      {:amount => 0.02,
  #       :url => 'https://garden.org/fresh/kale?partner=smooth'
  #      }
  #   ]
  def get_links_for_word(word)
    @words[word]
  end
end
