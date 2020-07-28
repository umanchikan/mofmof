class Property < ApplicationRecord
  has_many :near_stations, dependent: :destroy
  accepts_nested_attributes_for :near_stations, reject_if: :reject_posts, allow_destroy: true
end

def reject_posts(attributes)
  #attributes['line_name'].blank? && attributes['station_name'].blank? && attributes['minutes'].blank?
  exists = attributes[:id].present?
  empty = attributes[:line_name].blank? && attributes[:station_name].blank? && attributes[:minutes].blank?
  attributes.merge!(_destroy: 1) if exists && empty
  !exists && empty
end