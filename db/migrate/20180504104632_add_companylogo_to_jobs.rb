class AddCompanylogoToJobs < ActiveRecord::Migration[5.1]
  def change
    add_column :jobs, :companylogo, :string
  end
end
