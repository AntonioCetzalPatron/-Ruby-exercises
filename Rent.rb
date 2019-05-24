$array_rent = Array.new
$array_payment = Array.new

class Rent
  attr_accessor :id, :amount_for_pay, :user

  def initialize(amount_for_pay)
    puts "Amount: $#{amount_for_pay.to_f}"
    @amount_for_pay = amount_for_pay.to_f
  end

  def give_rent(user_id)
    if $array_users.empty? == true
      raise "No user records (Records: #{$array_users})."
    end

    if @amount_for_pay < 1
      raise "Invalid amount (Amount: $#{@amount_for_pay})."
    end

    find_user(user_id)
    return_id
    next_id

    $array_rent.push({id: @id, initial_amount: @amount_for_pay, user: @user, amount_for_pay: @amount_for_pay})
  end

  def deposit(amount)
    if amount.to_f < 1
      raise "Invalid amount (Amount: $#{amount.to_f})."
    end

    if amount.to_f > @amount_for_pay
      raise "Amount can not be greater $#{amount.to_f} > $#{@amount_for_pay}"
    end

    id = find_rent

    result = @amount_for_pay - amount.to_f
    $array_rent[id][:amount_for_pay] = result

    $array_payment.push({user: @user, count_before: @amount_for_pay, count_after: result, payment: amount})

    puts "\nAmount for pay: $#{@amount_for_pay}, Payment: $#{amount.to_f}, Amount to pay now: $#{@amount_for_pay - amount.to_f}"
  end

  def return_id
    $array_rent.empty? == true ? @id = 0 : @id = $array_rent[-1][:id]
  end

  def next_id
    @id = @id.next
  end

  def find_user(user_id)
    (0..($array_users.length-1)).each do |i|
      if $array_users[i][:id] == user_id.to_i
        puts "\n** Found user **"
        puts "User ID: #{$array_users[i][:id]}, Name: #{$array_users[i][:first_name]} #{$array_users[i][:last_name]}, Genre: #{$array_users[i][:genre]}"
        @user = {id: $array_users[i][:id], first_name: $array_users[i][:first_name], last_name: $array_users[i][:last_name], genre: $array_users[i][:genre]}
        return
      end
    end
    raise "The user is not in the records (User ID: #{user_id}, Records: #{$array_users})"
  end

  def find_rent
    (0..($array_rent.length-1)).each do |i|
      if $array_rent[i][:id] == @id.to_i
        puts "\n** Found rent **"
        puts "Rent ID: #{$array_rent[i][:id]}\nInitial amount: #{$array_rent[i][:initial_amount]}\nUser: #{$array_rent[i][:user]}\nAmount for pay: #{$array_rent[i][:amount_for_pay]}"
        return i
      end
    end
    raise "The rent is not in the records (Rent ID: #{@id}, Records: #{$array_rent})"
  end

  def find_payment
    (0..($array_payment.length-1)).each do |i|
      if $array_payment[i][:user] == @user
        puts "\n** Found payment **"
        puts "User: #{$array_payment[i][:user]}\nCount before: $#{$array_payment[i][:count_before]}\nPayment: $#{$array_payment[i][:payment]}\nCount after: $#{$array_payment[i][:count_after]}"
      end
    end
  end

end
