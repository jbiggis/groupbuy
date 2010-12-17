class Location < ActiveRecord::Base

belongs_to :company

translatable_columns :address

end
