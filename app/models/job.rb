class Job < ApplicationRecord
  mount_uploader :companylogo, CompanylogoUploader
  has_many :jobtypes
end
