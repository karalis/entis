require 'friendly_id'
module Refinery
  module Centers
    class Center < Refinery::Core::BaseModel
      extend FriendlyId
      friendly_id :name, use: [:slugged]
      self.table_name = 'refinery_centers'

      alias_attribute :title, :name

      attr_accessible :name, :state_id, :service_name, :service_head, :address, :phone, :fax, :email, :website, :creation, :accept_calls_from, :hours, :affiliation, :area_served, :staff, :position, :slug, :observer

      acts_as_indexed :fields => [:name, :service_name, :service_head, :address, :phone, :fax, :email, :website, :creation, :accept_calls_from, :hours, :affiliation, :area_served, :staff]

      validates :name, :presence => true, :uniqueness => true
      belongs_to :state, class_name: "::Refinery::States::State"

      default_scope order("name ASC")

      def self.with_observer_status
        where(observer: true)
      end
    end
  end
end
