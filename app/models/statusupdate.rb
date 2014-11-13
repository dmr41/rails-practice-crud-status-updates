class Statusupdate < ActiveRecord::Base

  validates :status, :user, :number, presence: true

end
