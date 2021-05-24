import prologue, json, times, tables, strutils, sets, locks

proc welcome*(ctx: Context) {.async.} = 
  resp "<h1>Welcome!</h1>"

proc ping*(ctx: Context) {.async.} =
  resp jsonResponse(%* {"time": $now()})



# This in reality will be a list with upwords of 5000 items
var wordSet = toHashSet(["Nim", "Nimrod", "FOSDEM", "Language"])
var wordLock: Lock
initLock(wordLock)



# Want to be able to do set memberships checks in this function
proc findNimWords*(text: string): seq[string] =
  {.gcsafe.}:
    withLock wordLock:
      for word in text.split(" "):
        if wordSet.contains(word): # wordSet is accessing global memory
          result.add(word)
  
  


proc textHandler*(ctx: Context) {.async, gcsafe.} =
  let text = ctx.getQueryParams("message", "")
  let analysis = findNimWords(text)
  resp jsonResponse(%* {"analysis": analysis})