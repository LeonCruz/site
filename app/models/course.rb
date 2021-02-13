require 'securerandom'

class Course
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  include Mongoid::Timestamps::Updated


  field :name, type: String
  field :uuid, type: String, default: SecureRandom.uuid
  field :description, type: String
  field :video_id, type: Integer
  field :source_code, type: String

  validates :name, :uuid, :description, :video_id, :source_code, presence: true
  validates :uuid, :video_id, :source_code, uniqueness: true

  belongs_to :user
end