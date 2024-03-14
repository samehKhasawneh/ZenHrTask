class RenameStatusAndChangeTypeInJobApplications < ActiveRecord::Migration[7.1]
  def change
    change_column :job_applications, :status, :boolean, default: false
  end
end
