require 'test_helper'

class AppointmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    DatabaseCleaner.start
    @appointment = appointments(:one)
  end

  test "should get index" do
    get api_v1_appointments_url, as: :json
    assert_response :success
  end

  test "should create appointment" do
    assert_difference('Appointment.count') do
      post api_v1_appointments_url, params: { appointment: { end_time: @appointment.end_time, start_time: @appointment.start_time, status: @appointment.status, user_id: @appointment.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show appointment" do
    get api_v1_appointment_url(@appointment), as: :json
    assert_response :success
  end

  test "should update appointment" do
    patch api_v1_appointment_url(@appointment), params: { appointment: { end_time: @appointment.end_time, start_time: @appointment.start_time, status: @appointment.status, user_id: @appointment.user_id } }, as: :json
    assert_response 200
  end

  # test "should not destroy appointment" do
  #   assert_difference('Appointment.count', 0) do
  #     delete api_v1_appointment_url(@appointment), as: :json
  #   end
  #
  #   assert_response 404
  # end
end
