class AddJobcityToJobs < ActiveRecord::Migration[5.1]
  def change
    add_column :jobs, :jobcity, :string
  end
end
