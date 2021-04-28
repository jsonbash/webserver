import prologue, json, times, tables, strutils, analysis

proc welcome*(ctx: Context) {.async.} = 
  resp "<h1>Welcome!</h1>"

proc ping*(ctx: Context) {.async.} =
  resp jsonResponse(%* {"time": $now()})


proc textHandler*(ctx: Context) {.async.} =
  #TODO Why can't I get postParams from json body?
  let text = ctx.getPostParams("message", "")
  let analysis = doAnalysisOnText(text)
  resp jsonResponse(%* {"analysis": analysis})