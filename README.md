# webserver

To fix: <br>
- [] issue with out of scope variable access: 
- [] access post fields with json incoming
- [] failing with --gc:orc
 

## Error getting when trying to compile
Error: type mismatch: got <Group, string, proc (ctx: Context): Future[system.void]{.locks: <unknown>.}>
but expected one of: 
proc post(group: Group; route: string; handler: HandlerAsync; name = "";
          middlewares: openArray[HandlerAsync] = @[])
  first type mismatch at position: 3
  required type for handler: HandlerAsync
  but expression 'textHandler' is of type: proc (ctx: Context): Future[system.void]{.locks: <unknown>.}
  This expression is not GC-safe. Annotate the proc with {.gcsafe.} to get extended error information.
1 other mismatching symbols have been suppressed; compile with --showAllMismatches:on to see them

expression: post(textParsing, "/analysis", textHandler)
make: *** [Makefile:2: dev] Error 1