-module(dolphins).
-compile(export_all).

dolphin1() ->
  receive
    {From, do_a_flip} ->
      From ! "How about no?~n";
    {From, fish} ->
      From ! "So long and thanks for all the fish!~n";
    _ ->
      io:format("Heh, we're so much smarter than you humans.~n")
  end.