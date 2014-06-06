class PasswordChecker
  def method_missing(meth, *args, &block)
    if meth.to_s == "abracadabra"
      puts "Access Granted"
    else
      puts "Invalid Password"
    end
  end
end
