class AppointmentSerializer < ActiveModel::Serializer
  attributes :id, :start_time, :end_time, :status
end
