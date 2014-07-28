Object subclass: Rambler [
  Rambler class [
    so:something walksInto:aPlace andThe:person looksUpAndSays:thePunchline [
      'Let me tell you a joke' printNl.
      ('So, ',something,' walks into ',aPlace) printNl.
      ('And the ',person,' looks up and says, "',thePunchline, '"') printNl.
      '' printNl.
      'Can you believe that?' printNl.
    ]
  ]
]

Rambler so: 'a guy' walksInto: 'a bar' andThe: 'bartender' looksUpAndSays: 'Stop telling these stupid jokes'.
'===================================' printNl.
Rambler so: 'an alien' walksInto: 'a space station' andThe: 'bartender' looksUpAndSays: 'Why is there a bartender on a space station?'.