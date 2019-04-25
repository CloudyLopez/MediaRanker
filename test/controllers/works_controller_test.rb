require "test_helper"

describe WorksController do
  it "should get index" do
    get works_index_url
    value(response).must_be :success?
  end

end
