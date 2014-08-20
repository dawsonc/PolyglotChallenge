function dit() {
  print "\a"
  system("sleep 0.2")
}

function dah() {
  print "\a"
  system("sleep 0.5")
}

function char_break() {
  system("sleep 0.5")
}

/^(-|dit)/ { dit()        }
/^(_|dah)/ { dah()        }
/^$/       { char_break() }