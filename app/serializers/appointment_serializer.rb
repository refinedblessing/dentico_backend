class AppointmentSerializer < ActiveModel::Serializer
  attributes :id, :start_time, :end_time, :status
  has_one :user
end
