require "test_helper"

class AuthorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  setup do
    @author = authors(:one)
  end

  test "name should be valid" do
    pp @author
    assert true
  end
end
