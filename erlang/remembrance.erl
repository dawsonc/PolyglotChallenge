-module(remembrance).
-compile(export_all).

hindbrain(Train_of_thought) ->
  receive
    {From, {memorize, Thought}} ->
      From ! {self(), memorize_ok},
      hindbrain([Thought|Train_of_thought]);
    {From, remember} ->
      case length(Train_of_thought) of
        0 ->
          From ! {self(), empty_train_of_thought},
          hindbrain(Train_of_thought);
        _ ->
          [Head | Tail] = Train_of_thought,
          From ! {self(), {remember_ok, Head}},
          hindbrain(Tail)
      end;
    {From, terminate} ->
      From ! {self(), terminate_ok}
  end.

memorize(PID, Thought) ->
  PID ! {self(), {memorize, Thought}},
  receive
    {PID, Msg} -> Msg
  after 3000 -> timeout
  end.

remember(PID) ->
  PID ! {self(), remember},
  receive
    {PID, {remember_ok, Thought}} -> Thought
  after 3000 -> timeout
  end.

terminate(PID) ->
  PID ! {self(), terminate},
  receive
    {PID, terminate_ok} -> terminate_ok
  after 3000 -> timeout
  end.