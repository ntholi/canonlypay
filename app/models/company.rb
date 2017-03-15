class Company < ApplicationRecord
	has_many :adverts
	validates :phone_number, presence: true
	validates_uniqueness_of :phone_number

	def to_s
		if !company_name.to_s.empty?
			company_name
		else
			full_name
		end
	end

	def full_name
		"#{first_name} #{last_name}"
	end
end
