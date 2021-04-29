import prologue, json, tables, routes


let settings = loadSettings("./config.json") 


let 
  app = newApp(settings)
  root = newGroup(app, "/")
  textParsing = newGroup(app, "/api/v1/text")


################################
##         ROOT GROUP
## GET / 
## GET /ping
root.get("/", welcome)
root.get("/ping", ping)

################################
##         TEXT PARSING GROUP
## get /api/v1/text/analysis
textParsing.get("/analysis", textHandler)



app.run()


#TODO: 
# -Need text transformations for the following:
#   [X] Companies from text
#   [ ] Sentiment from text
#   [ ] Nouns from text
#  
# - Need to spawn a thread to deal with compute heavy operations
#   [ ] Use a channel to spawn thread for each expensive operation
