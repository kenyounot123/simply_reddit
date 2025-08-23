require "minitest/autorun"
require "simply_reddit"

class SimplyRedditTest < Minitest::Test

  def test_prints_hello_world
    assert_output("hello world\n") { SimplyReddit.hi }
  end
end