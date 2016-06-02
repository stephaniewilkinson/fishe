class Experiment < ActiveRecord::Base
  belongs_to :scientist

  has_many :logs, dependent: :destroy

  #needed a nested form! allow_destroy is a method to make the
  # #destroy parent cascade to all children

  accepts_nested_attributes_for :logs, allow_destroy: true
end
