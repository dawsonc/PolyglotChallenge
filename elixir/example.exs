defmodule LooksLikeRuby do
  def this_syntax_is_familiar do
    "This function declaration is almost valid Ruby (except for that extra 'do')"
  end

  def but_with_a_twist(x) when is_integer(x) do
    "Look at that pattern matching!"
  end
end

IO.puts LooksLikeRuby.this_syntax_is_familiar
IO.puts LooksLikeRuby.but_with_a_twist(2)

IO.puts "\nYou can also use anonymous functions"
the_function_with_no_name = fn a, b -> :math.sqrt(a*a + b*b) end
hypotenuse = the_function_with_no_name.(3, 4)
IO.puts "A Pythagorean tripe: 3, 4, & #{hypotenuse}"

IO.puts "\nAnd now for another mainstay of the functional style: pattern matching!"
msg = {:error, 404, "The page you requested could not be found"}
case msg do
  {:success, code, message} ->
    IO.puts "Success! Code: #{code} returned with message \"#{message}\""
  {:error, code, message} ->
    IO.puts "OH NO! An error (code #{code}) occured, returning message \"#{message}\""
end