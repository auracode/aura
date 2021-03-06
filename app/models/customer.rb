  class Customer < ActiveRecord::Base
  attr_accessible :address, :name, :phone_number, :area, :consumer_no, :installation_date, :flavors, :machine_count, :plan, :quote, :period, :gstid, :how_to_reach, :hidden

  default_scope order('installation_date ASC')
  has_many :payments
  has_many :bills , :through => :payments
  

  def self.to_csv(options={})
    @column_names= Customer.new.attributes.map {|k,v| k.to_s}.delete_if {|x| ["created_at", "updated_at"].include?(x)}
  	CSV.generate(options) do |csv|
  		csv << @column_names
  		all.each do |customer|
  			csv << customer.attributes.values_at(*@column_names)
  		end
  	end
  	
  end

  def sort_by_consumer_no
    Customer.order(:consumer_no)
  end

  def self.search(search)
    if search
      find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end
  
  def delivery_date
    @customer = Customer.find(self.id)
    @customer.installation_date + (@customer.period ? @customer.period.days : 0.days)     
  end

  def delivery_date_for
    @customer.installation_date + (@customer.period ? @customer.period.days : 0.days)     
  end


  def delivery_date_f
    @customer = Customer.find(self.id)
    delivery_date_for.strftime("%B %d, %Y")  
  end


  def self.total_employed_machines
    Customer.all.map {|x| x.machine_count ? x.machine_count : 0 }.sum
  end


  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Customer.create! row.to_hash
    end
  end

  def self.is_delivery_day?  
    all.map { |e| e.delivery_date }.include?(Date.today)
  end
  
  def self.deliveries
      all.map { |x| x.consumer_no if x.delivery_date == Date.today }
  end   
  
  def pending
    if Customer.find(self.id).bill_ids.nil?
      print "No bill raised"
    else
     Bill.find(Customer.find(self.id).bill_ids).collect {|b| b.amount if b.status == "Pending"}.compact.sum
    end
  end
end
