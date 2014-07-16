#!bin/bash

# I added this on to the PS1 from bashstrap (https://github.com/barryclark/bashstrap)
# but you can put it wherever you want

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

# Preferences for the battery status bar graph; set these to whatever looks nice
MAX_NUM_BARS=6
BAR_SYM="▮"

# Construct bar graph
BAR_STRING=""
NUM_BARS=$(echo "scale=0; $BATTERY_FRAC*$MAX_NUM_BARS" | bc) # scale=0 forces integer output
for i in `seq 1 $NUM_BARS`; do
  BAR_STRING="$BAR_STRING$BAR_SYM" # Concatenate another bar onto the string
done

echo "$BAR_STRING"