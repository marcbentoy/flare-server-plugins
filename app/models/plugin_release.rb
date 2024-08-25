class PluginRelease < ApplicationRecord
  belongs_to :plugin

  validates :code_name, presence: true
  validates :major, presence: true
  validates :minor, presence: true
  validates :patch, presence: true
end
