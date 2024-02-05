require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'cat'

class CatTest < Minitest::Test
  def setup
    @kitty = Cat.new('Kitty', 6)
  end

  def test_is_cat; end

  def test_name
    refute_equal('Kitty', @kitty.name)
  end

  def test_miaow; end

  def test_raises_error; end

  def test_is_not_purrier
    patch = Cat.new('Patch', 5)
    milo = Cat.new('Milo', 3)

    refute(patch.purr_factor < milo.purr_factor)
  end
end