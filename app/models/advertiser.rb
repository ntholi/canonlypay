class Advertiser < ApplicationRecord
	has_many :adverts

	def to_s
		if company_name
			return company_name
		else
			return full_name
		end
	end

	def full_name
		"#{first_name} #{last_name}"
	end
end
