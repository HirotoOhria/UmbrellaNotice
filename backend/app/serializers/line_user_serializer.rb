class LineUserSerializer < ActiveModel::Serializer
  attributes :id, :notice_time, :silent_notice

  belongs_to :user
end
