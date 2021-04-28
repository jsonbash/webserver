dev:
	nim c --gc:orc -r src/mercury.nim

threads:
	nim c --threads:on --gc:orc -r src/mercury.nim
