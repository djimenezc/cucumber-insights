require 'minitest/autorun'
require 'active_support/core_ext/integer/inflections'
require '../config/initializers/time'

class HelperTest < Minitest::Unit::TestCase

  def setup
    puts 'Initializer HelperTest'
    @time = Time.new(2008,6,21, 13,30,0, '+09:00')
  end

  def test_my_date_format

    puts "My Date: #{@time.to_s(:clavis_datepicker)}"
    assert_equal('21st Jun, 2008', time.to_s(:clavis_datepicker))
  end

  def test_ordinalize_formatter

    puts 'ordinalize_formatter ' + time.strftime("#{time.day.ordinalize} %b, %Y")
    assert_equal('21st Jun, 2008', time.to_s(:clavis_datepicker))
  end
end
