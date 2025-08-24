require "minitest/autorun"
require "simply_reddit"

class SimplyRedditTest < Minitest::Test
  def test_base_client_can_be_instantiated
    base_client = SimplyReddit::BaseClient.new(
      base_url: "https://api.example.com",
      headers: { "User-Agent" => "Test" }
    )
    
    assert_instance_of SimplyReddit::BaseClient, base_client
  end
  
  def test_client_inherits_from_base_client
    assert SimplyReddit::Client < SimplyReddit::BaseClient
  end
end