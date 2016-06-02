class Scientist < ActiveRecord::Base

  after_initialize :default_discipline

  has_many :experiments, dependent: :destroy

  validates :name, presence: true, uniqueness: true

  validate :no_more_dr_oz

    private

    def default_discipline
      self.discipline ||= 'General Science'
    end

    def no_more_dr_oz
      if self.name == 'Mehmet Oz'
        errors.add(:name, "-No more Dr. Oz")
      end
  end
end
