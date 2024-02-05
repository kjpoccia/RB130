require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'easy_test_1'

class EasyTest < Minitest::Test
  def setup
    @value = 7
    @word = "XYZ"
    @nil_value = nil
    @array = []
    @list = %w(abc xyz)
  end

  def test_odd
    assert_equal(true, @value.odd?)
  end

  def test_downcase
    assert_equal('xyz', @word.downcase)
  end

  def test_nil
    assert_nil @nil_value
  end

  def test_empty
    assert_empty @array
  end

  def test_xyz
    assert_includes(@list, 'xyz')
  end

  def test_instance_of
    value = 4
    assert_kind_of(Numeric, value)
  end

  def test_list
    assert_equal(list, list.process)
  end

  def test_refute
    refute_includes(@list, 'xyz')
  end

end