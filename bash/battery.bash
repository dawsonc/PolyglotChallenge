#!/bin/bash

get_battery_string ()
{
  # Get the current capacity of your battery
  CAPACITY=$(ioreg -n AppleSmartBattery -r |
              awk '/\"CurrentCapacity\" = ([0-9]*)/ { print $3 }')

  # Get the maximum capacity of your battery
  MAX_CAPACITY=$(ioreg -n AppleSmartBattery -r |
                  awk '/\"MaxCapacity\" = ([0-9]*)/ { print $3 }')

  # Battery percentage is CAPACITY / MAX_CAPACITY * 100%, but we only need the fraction
  # (Hack to do floating point math: delegate out to bc)
  # (scale=5 gives 5 decimal places of precision)
  BATTERY_FRAC=$(echo "scale=5; $CAPACITY/$MAX_CAPACITY" | bc)
  BATTERY_FRAC=$(printf "%.1f" "$BATTERY_FRAC") # Round to nearest 10th

  MAX_NUM_BARS=10
  BAR_SYM="▮" # Set this to whatever you want. Go nuts

  # Construct bar graph
  BATTERY_STRING=""
  NUM_BARS=$(echo "scale=0; $BATTERY_FRAC*($MAX_NUM_BARS - 1) + 1" | bc) # scale=0 forces integer output
  for i in `seq 1 $NUM_BARS`; do
    BATTERY_STRING="$BATTERY_STRING$BAR_SYM" # Concatenate another bar onto the string
  done

  # Append padding characters to make sure BATTERY_STRING has constant width
  PADDING_NEEDED=$(echo "scale=0; $MAX_NUM_BARS - $NUM_BARS" | bc)
  for i in `seq 0 $PADDING_NEEDED`; do
    BATTERY_STRING="$BATTERY_STRING "
  done


  # Colorize BATTERY_STRING appropriately
  # Under 20% => magenta
  # Under 40% => orange
  # Under 80% => green
  # Otherwise => bright green
  if [[ $(echo "$BATTERY_FRAC < 0.20" | bc) = 1 ]]; then
    BATTERY_STRING="$(tput setaf 1)$BATTERY_STRING$(tput sgr0)";
  elif [[ $(echo "$BATTERY_FRAC < 0.40" | bc) = 1 ]]; then
    BATTERY_STRING="$(tput setaf 3)$BATTERY_STRING$(tput sgr0)";
  elif [[ $(echo "$BATTERY_FRAC < 0.80" | bc) = 1 ]]; then
    BATTERY_STRING="$(tput setaf 2)$BATTERY_STRING$(tput sgr0)";
  else
    BATTERY_STRING="$(tput setaf 120)$BATTERY_STRING$(tput sgr0)";
  fi

  echo "$BATTERY_STRING"
}

# Save this file to ~/bin/battery.bash and run "chmod 755 ~/bin/battery.bash"
# Add the following line to your ~/.bash_profile:
# source ~/bin/battery.bash

# Incorporate the get_battery_string function into your PS1 variable (the prompt variable) in your .bash_profile
# ex: PS1="$(get_battery_string)>>"