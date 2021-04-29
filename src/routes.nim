import prologue, json, times, tables, strutils

proc welcome*(ctx: Context) {.async.} = 
  resp "<h1>Welcome!</h1>"

proc ping*(ctx: Context) {.async.} =
  resp jsonResponse(%* {"time": $now()})



let globWords = @["yes", "no"]
var perThread {.threadvar.}: seq[string]



proc doAnalysisOnText*(text: string): seq[string] =
  {.gcSafe.}:
    deepCopy(perThread, globWords)
    result = @[]
    for word in text.split(" "):
      if perThread.contains(word):
        continue
      if word[0] == '$':
        result.add(word)


proc textHandler*(ctx: Context) {.async, gcSafe.} =
  #TODO Why can't I get postParams from json body?
  let text = ctx.getQueryParams("message", "")

  let analysis = doAnalysisOnText(text)
  resp jsonResponse(%* {"analysis": analysis})