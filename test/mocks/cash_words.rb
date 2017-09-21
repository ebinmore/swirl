# Boss, I wrote a mocking library to make sure we are selecting the
# highest amount from our affiliates
class FakeCashWords
  def has_word?(word) word == 'cheese'; end
  def get_links_for_word(word)
    [
      { url:'https://cheapo.com/food', amount: 0.001},
      { url:'https://bigmoney.com/rottenstuff', amount: 0.02}
    ]
  end
end
