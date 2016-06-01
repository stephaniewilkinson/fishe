class Experiment < ActiveRecord::Base
  belongs_to :scientist
  has_many :logs, dependent: :destroy
end
