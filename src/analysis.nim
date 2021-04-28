import tables, strutils

let affWords = ["yes", "no"]


proc doAnalysisOnText*(text: string): Table[string, int] =
  var chars = 0
  var words = 0
  var affirm = 0
  
  for word in text.split(" "):
    words += 1
    if affWords.contains(word):
        affirm += 1
    for chr in word:
      chars += 1

  result["chars"] = chars
  result["words"] = words
  result["affirm"] = affirm