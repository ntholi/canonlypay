class Advertiser < ApplicationRecord
	has_many :adverts

	def fullname
		"#{first_name} #{second_name}"
	end
	def name
		if company_name
			return company_name
		else
			return fullname
		end
	end

	def to_s
		return name
	end
end
