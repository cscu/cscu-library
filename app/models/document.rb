class Document < ActiveRecord::Base
  belongs_to :course
  has_attached_file :file,
    :storage => :s3,
    :bucket => ENV['AWS_S3_BUCKET'],
    :s3_credentials => {
      :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
      :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
    }
end
