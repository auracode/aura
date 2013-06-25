class Customer < ActiveRecord::Base
  attr_accessible :address, :name, :phone_number, :area, :consumer_no, :installation_date, :flavors, :machine_count, :plan

  def self.to_csv(options={})
    @column_names= Customer.new.attributes.map {|k,v| k.to_s}
  	CSV.generate(options) do |csv|
  		csv << @column_names
  		all.each do |customer|
  			csv << customer.attributes.values_at(*@column_names)
  		end
  	end
  	
  end
  def delivery_date
    @customer = Customer.find(:id)
    @customer.installation_date + @customer.plan
  end

end
