module IndexHelper
	def delivery_status
		ap = Customer.deliveries
	   "#{ap.compact.count} with consumer numbers #{ap.compact.map {|x| x.to_s if x != nil}}"
	end
end
