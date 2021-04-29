import strutils

let affWords* = @["yes", "no"]


proc doAnalysisOnText*(text: string): seq[string] {.thread.}=
  for word in text.split(" "):
    if affWords.contains(word):
      continue
    if word[0] == '$':
      result.add(word)