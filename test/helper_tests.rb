require 'minitest/autorun'
require 'active_support/core_ext/integer/inflections'
require '../config/initializers/time'

class HelperTest < Minitest::Unit::TestCase

  def test_my_date_format

    date = Time.now
    puts "My Date: #{date.to_s(:my_date)}"
    assert true
  end

  # def ordinalize_formatter
  #
  #   time = Time.new
  #   puts 'ordinalize_formatter ' + time.strftime("%a %b #{time.day.ordinalize}")
  #   assert true
  # end
end
