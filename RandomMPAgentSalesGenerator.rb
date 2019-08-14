#Creates a CSV file for testing the MP self serve option.
#This version doesn't have validations or error handlers yet as well as the reutilization methods and classes.

require "csv"

class RandomMPAgentSalesGenerator 
  def initialize
	generate_random_data
  end

  def create_random_string(n)
  	(0...n.to_i).map { ('a'..'z').to_a[rand(26)] }.join
  end

  def random_agent_type()
  	["Over and Under 65","Over 65"].sample
  end 

  def random_phone_number()
  	randomThree = (rand 100..999).to_s
  	randomFour = (rand 1000..9999).to_s
  	return "(#{randomThree}) #{randomThree}-#{randomFour}"
  end

  def is_a_valid_email?(email)
    (email =~ /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i)
  end

  def generate_random_data
  	puts "Insert file name:"
  	filename= gets.chomp
  	puts "Insert number of rows:"
  	rowsNumber= gets.chomp.to_i
    fmoEmail=""
    columns=["Firstname","Lastname","Middlename","PhoneNumber","EmailAddress","AgentType","FMO"] 
    
    loop do
    puts "Insert a valid FMO email that already exist:"
    fmoEmail = gets.chomp
     if is_a_valid_email?(fmoEmail)
      break
    end
       puts "Email syntax is wrong."  
    end

	CSV.open(filename+".csv", "w") do |csv|
  	csv << columns
  		for i in 1..rowsNumber do
			email=create_random_string(5)+"@example"+create_random_string(4)+".com"	
	  		csv << ["Test"+create_random_string(4),"Test"+create_random_string(4),create_random_string(1),random_phone_number(),email,random_agent_type,fmoEmail]
		end
    end
  end

end

RandomMPAgentSalesGenerator.new