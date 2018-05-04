class Jobtype < ApplicationRecord
  belongs_to :job, optional: true
end
