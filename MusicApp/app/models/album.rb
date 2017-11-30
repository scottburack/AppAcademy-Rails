class Album < ApplicationRecord
  validates :title, :year, :band, presence: true
  validates :live_or_studio, inclusion: { in: [true, false]}
  validates :title, uniqueness: {scope: :band_id}
  validates :year, numericality: {minimum: 1900, maximum: 2020}


  belongs_to :band,
    class_name: 'Band',
    foreign_key: :band_id

  after_initialize :set_defaults

  def set_defaults
    self.live_or_studio ||= false
 end
end
