require "csv"

class RandomAdminGenerator 
  def initialize
	createRandomAdminCSVFile
  end

  def createRandomString(n)
  	(0...n.to_i).map { ('a'..'z').to_a[rand(26)] }.join
  end

  def randomAdminRole()
  	["SuperAdmin", "AdminLevelOne", "AdminLevelTwo", "AdminLevelThree"].sample
  end 

  def randomPhoneNumer()
  	randomThree = (rand 100..999).to_s
  	randomFour = (rand 1000..9999).to_s
  	return "(#{randomThree}) #{randomThree}-#{randomFour}"
  end

  def createRandomAdminCSVFile
  	puts "Insert file name:"
  	filename= gets.chomp + "_admin"
  	puts "Insert number of rows:"
  	rowsNumber= gets.chomp.to_i

	CSV.open(filename+".csv", "w") do |csv|
  	csv << ["FirstName","LastName","MiddleName","PhoneNumber","EmailAddress","Role"]
  		for i in 1..rowsNumber do
			email="admin_"+createRandomString(5)+"@example"+createRandomString(4)+".com"	
	  		csv << ["TestAdmin"+createRandomString(4),"TestAdmin"+createRandomString(4),createRandomString(1),randomPhoneNumer(),email,randomAdminRole()]
		end
    end
  end

end

# initialize object
RandomAdminGenerator.new