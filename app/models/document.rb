class Document < ActiveRecord::Base
  belongs_to :course
  has_attached_file :file,
    :url => '/documents/:id/:attachment/:filename',
    :storage => ENV['PAPERCLIP_STORAGE'],
    :bucket => ENV['AWS_S3_BUCKET'],
    :s3_credentials => {
      :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
      :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
    }

  def self.semesters
    ['Fall','Winter','Spring','Summer']
  end

  def self.categories
    ['Final','Test','Quiz','Notes','Other']
  end
end
