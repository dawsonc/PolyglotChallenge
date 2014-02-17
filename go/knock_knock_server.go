package main

import (
  "fmt"
  "math/rand"
  "time"
  "net/http"
)

func getJoke() string {
  x := [4]string{
    "<p>Knock knock</p><p>Who's there?</p><p>Me</p><p>Me who?</p><p>Me Gusta</p><img src=\"http://www.stickerish.com/wp-content/uploads/2011/04/MeGustaBlackSS.png\" alt=\"yes\">",
    "Knock knock\nWho's there?\nBanana\nBanana who?\nKnock knock\nWho's there?\nBanana\nBanana who?\nKnock knock\nWho's there?\nBanana\nBanana who?\nKnock Knock\nWho's there?\nOrange\nOrange who?\nOrange you glas I didn't say banana?",
    "Knock knock\nWho's there?\nRufus\nRufus who?\nRufus the most important part of your house.",
    "Knock knock\nWho's there?\nDoris\nDoris who?\nDoris locked, that's why I'm knocking"} 

  rand.Seed(time.Now().UnixNano())
  joke := x[rand.Intn(4)]
  return joke
}

func handler(w http.ResponseWriter, r *http.Request) {
  fmt.Fprintf(w, getJoke())
}

func main() {
  http.HandleFunc("/", handler)
  http.ListenAndServe(":8080", nil)
}