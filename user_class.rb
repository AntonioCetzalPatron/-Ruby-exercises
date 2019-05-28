# frozen_string_literal: true

# Class of users (UserClass), the user is stored for processing in the rents.
class UserClass
  attr_accessor :id, :firstname, :lastname, :genre
  attr_reader :users

  def initialize(firstname, lastname)
    @firstname = firstname.to_s
    @lastname = lastname.to_s
    @genre = male_famale == 1 ? 'Male' : 'Female'
    @users = []
  end

  def save
    next_id(return_id != 0 ? users[-1][:id] : 0)
    users << { id: id, firstname: firstname, lastname: lastname, genre: genre }
  end

  def return_id
    return 0 if users.empty?
  end

  def next_id(id)
    @id = id.next
  end

  def male_famale
    rand(2)
  end

  def records
    users.each do |array|
      puts "\nUser ID: #{array[:id]}"
      puts "Name: #{array[:firstname]} #{array[:lastname]}"
      puts "Genre: #{array[:genre]}"
    end
  end
end

user = UserClass.new('Nombre1', 'Apellido1')

require_relative 'rent_class'

rent = RentClass.new(2300, user.save)

rent.give_rent(1)

rent.deposit(2000)

rent.payment
