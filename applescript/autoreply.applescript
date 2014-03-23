using terms from application "Messages"
  on message received the_message from the_buddy for the_chat
    if first name of the_buddy = "Bob" then
      send "For the love of LISP, Bob, stop texting me!" to the buddy
    else if first name of the_buddy = "Fred" then
      send "No" to the_buddy
    else
      send "I can't get to my phone right now. I'll get back to you ASAP" to the_buddy
    end if
  end message received
end using terms from