class Renametable < ActiveRecord::Migration
  def change
    rename_table :status_updates, :statusupdates
  end
end
