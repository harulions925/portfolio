require "test_helper"

class StudyLogsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get study_logs_index_url
    assert_response :success
  end
end
