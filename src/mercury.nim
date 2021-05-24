import prologue, json, tables, routes


let settings = loadSettings("./config.json") 


let 
  app = newApp(settings)
  root = newGroup(app, "/")


################################
##         ROOT GROUP
root.get("/", welcome)
root.get("/ping", ping)
root.get("/analysis", textHandler)



app.run()

