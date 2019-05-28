# frozen_string_literal: true

# Class of the payment, an payment is
# given to some user and he is allowed to pay to his account
class RentClass ### sin Class
  attr_accessor :id, :amount, :user
  attr_reader :rent, :pay

  def initialize(amount, users)
    puts "Amount: $#{amount}" #### sin puts
    @amount = amount.to_f #### sin to_f
    @users = users
    @rent = []
    @pay = []
  end

  def give_rent(user_id) ### find
    raise "No user records (Records: #{@users})." if @users.empty? == true ### nil, {}

    raise "Invalid amount (Amount: $#{@amount})." if @amount < 1

    firstname(user_id) ### user.name
    next_id(return_id != 0 ? rent[-1][:id] : 0) ### logica dentro del metodo 
    @rent << { id: @id, initial_amount: @amount, user: @user, amount: @amount }
  end

  def deposit(amount)
    raise "Invalid amount (Amount: $#{amount})." if amount.to_f < 1

    raise "Amount can not be greater thah $#{@amount}" if amount.to_f > @amount

    id = findrent ###
    result = @amount - amount.to_f
    @rent[id][:amount] = result
    @pay.push user: @user, count: result, payment: amount
    puts "\nPayment: $#{amount}\
    \nAmount to pay now: $#{result}"
    findrent
  end

  def return_id
    return 0 if rent.empty?
  end

  def next_id(id)
    @id = id.next
  end

  def firstname(id)
    (0..(@users[-1][:id]) - 1).each do |i|
      next unless @users[i][:id] == id

      puts "Name: #{@users[i][:firstname]}"
      @user = { id: @users[i][:id], lastname: @users[i][:lastname] }
      return @user
    end
    raise "The user is not in the records (User ID: #{id})"
  end

  def findrent
    (0..(@rent.length - 1)).each do |i|
      next unless @rent[i][:id] == @id

      puts "\nRent ID: #{@rent[i][:id]}\
      \nUser: #{@rent[i][:user][:lastname]}\
      \nAmount for pay: #{@rent[i][:amount]}\n"
      return i
    end
    raise "The rent is not in the records (Rent ID: #{@id}, Records: #{@rent})"
  end

  def payment
    (0..(@pay.length - 1)).each do |i|
      next unless @pay[i][:user] == @user

      puts "\nUser: #{@rent[i][:user][:lastname]}\
      \nPay: $#{@pay[i][:payment]}\
      \nCount: $#{@pay[i][:count]}\n"
    end
  end
end
