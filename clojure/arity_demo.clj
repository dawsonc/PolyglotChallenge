(defn speakeasy
  ([]
    "...")
  ([knock]
    "Why are you knocking on my door?")
  ([knock1 knock2]
    "Welcome! Come right on in")
  ([knock1 knock2 knock3]
    "Go away. I'm trying to sleep"))

(println (str "Not knocking: " (speakeasy)))
(println (str "Knocking once: " (speakeasy "knock"))
(println (str "Knocking twice: " (speakeasy "knock" "knock")))
(println (str "Knocking thrice: " (speakeasy "knock" "knock" "knock")))