let someStuff = [
  My stuff: [0, 2, 4],
  Your stuff: [1, 3, 5]
]

func whoHasMoreStuff (stuff1: Int[], stuff2: Int[]) -> String {
  var sum1 = 0
  for thing in stuff1 {
    sum1 = sum1 + thing
  }

  var sum2 = 0
  for thing in stuff2 {
    sum2 = sum2 + thing
  }
}
