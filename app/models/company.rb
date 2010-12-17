class Company < ActiveRecord::Base

belongs_to :deal
has_many :company_contact_infos
has_many :locations, :dependent => :destroy

accepts_nested_attributes_for :locations, :allow_destroy => true

translatable_columns :name
end
