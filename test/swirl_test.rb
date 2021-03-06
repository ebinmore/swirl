require "test_helper"

class SwirlTest < Test::Unit::TestCase
  def test_that_it_has_a_version_number
    refute_nil ::Swirl::VERSION
  end

  def test_basic_interface
    swirl = Swirl.new

    assert(swirl.is_a?(Swirl::Parser),
          'Swirl should be able to be instantiated')

    assert(swirl.respond_to?(:add_html),
          'Swirl should be able to accept an html string via :add_html')

    assert(swirl.respond_to?(:use_affiliate_database),
          'Swirl should be able to use a database look up via :use_affiliate_database')

    assert(swirl.respond_to?(:money_making_html),
          'Swirl should return the final html via :money_making_html')
  end

  def test_without_a_database_no_money_making_changes_are_performed
    sample_string = '<h1>Latest Craze, cheese smoothies!</h1>'
    swirl = Swirl.new
    swirl.add_html(sample_string)
    assert_equal sample_string, swirl.money_making_html
  end

  def test_with_a_database_money_making_changes_are_performed
    sample_string = '<h1>Latest Craze, cheese smoothies!</h1>'
    swirl = Swirl.new
    swirl.add_html(sample_string)
    swirl.use_affiliate_database(CashWords.new)
    assert_not_equal sample_string, swirl.money_making_html
  end

  def test_money_making_changes_insert_a_link
    sample_string = '<h1>Latest Craze, cheese smoothies!</h1>'
    swirl = Swirl.new
    swirl.add_html(sample_string)
    swirl.use_affiliate_database(CashWords.new)
    assert swirl.money_making_html.include?('href'),
          'links must include an href attribute'
  end

  def test_money_making_can_handle_weird_cases
    sample_string = '<h1>Latest Craze, CHEese smoothies!</h1>'
    swirl = Swirl.new
    swirl.add_html(sample_string)
    swirl.use_affiliate_database(CashWords.new)
    assert swirl.money_making_html.include?('href'),
          'links must include an href attribute'
  end

  def test_money_making_can_handle_weird_cases_without_mangling_the_text
    sample_string = '<h1>Latest Craze, CHEese smoothies!</h1>'
    swirl = Swirl.new
    swirl.add_html(sample_string)
    swirl.use_affiliate_database(CashWords.new)
    output = swirl.money_making_html
    assert output.include?('CHEese'),
          'links must maintain their inner text formatting ('+output+')'
  end

  def test_money_making_changes_can_handle_multiple_changes
    sample_string = '<p>Latest Craze, cheese smoothies and kale! </p>'
    swirl = Swirl.new
    swirl.add_html(sample_string)
    swirl.use_affiliate_database(CashWords.new)
    output = swirl.money_making_html

    assert_equal 2, output.scan(/href/).count,
                'links must include two links ('+output+')'
  end

  def test_will_pick_the_highest_affiliate_amount
    sample_string = '<p>Latest Craze, cheese smoothies!</p>'
    swirl = Swirl.new
    swirl.add_html(sample_string)
    swirl.use_affiliate_database(CashWords.new)
    output = swirl.money_making_html
    assert_include output, 'bigmoney.com'
  end

  def test_wont_mangle_the_html
    sample_string = '<p>Latest Craze, cheese smoothies and kale! </p>'
    swirl = Swirl.new
    swirl.add_html(sample_string)
    swirl.use_affiliate_database(CashWords.new)
    monetized_html = swirl.money_making_html
    assert_equal monetized_html, Nokogiri::HTML::DocumentFragment.parse(monetized_html).to_html
  end
end
