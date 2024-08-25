class Plugin < ApplicationRecord
  has_many :plugin_release, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true
  validates :status, presence: true
  validates :major, presence: true
  validates :minor, presence: true
  validates :patch, presence: true
end
