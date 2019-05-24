require_relative "Rent"
$array_users = Array.new

class User
  attr_accessor :id, :first_name, :last_name, :genre

  def initialize(first_name, last_name)
    @first_name = first_name.to_s
    @last_name = last_name.to_s
    @genre = genre
  end

  def save
    return_id
    next_id

    $array_users.push({id: @id, first_name: @first_name, last_name: @last_name, genre: @genre})
  end

  def return_id
    $array_users.empty? == true ? @id = 0 : @id = $array_users[-1][:id]
  end

  def next_id
    @id = @id.next
  end

  def genre
    number = rand(2)
    return number == 0 ? "Male" : "Female"
  end

  def records
    $array_users.each do |array|
      puts "User ID: #{array[:id]}"
      puts "Name: #{array[:first_name]} #{array[:last_name]}"
      puts "Genre: #{array[:genre]}"
      puts "-" * 20
    end
  end

  def first_and_last_record
    puts "\n** First record **"
    puts "User ID: #{$array_users[0][:id]}"
    puts "Name: #{$array_users[0][:first_name]} #{$array_users[0][:last_name]}"
    puts "Genre: #{$array_users[0][:genre]}"
    puts "-" * 20
    puts "\n** Last record **"
    puts "User ID: #{$array_users[-1][:id]}"
    puts "Name: #{$array_users[-1][:first_name]} #{$array_users[-1][:last_name]}"
    puts "Genre: #{$array_users[-1][:genre]}"
    puts "-" * 20
  end

end

#Clase User ********************************************************************

#Usuarios ingresados ***********************************************************
user = User.new("Nombre1", "Apellido1")
user.save

user = User.new("Nombre2", "Apellido2")
user.save

user = User.new("Nombre3", "Apellido3")
user.save
#*******************************************************************************

#Genera el primer y ultimo registro de usuarios ********************************
user.first_and_last_record
#*******************************************************************************

#Dar a todos los usuarios registrados ******************************************
user.records
#*******************************************************************************

#Clase Rent ********************************************************************

#Instancia de la clase Rent ****************************************************
rent = Rent.new(2300)
#*******************************************************************************

#Buscar a usario por su ID *****************************************************
rent.find_user(3)
#*******************************************************************************

#Dar una renta a usuario *******************************************************
rent.give_rent(1)
#*******************************************************************************

#Abonar a cuenta ***************************************************************
rent.deposit(2000)
#*******************************************************************************

#Genera todos los pagos realizados *********************************************
rent.find_payment
#*******************************************************************************
