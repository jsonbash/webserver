dev:
	nim c -r src/mercury.nim

threads:
	nim c --threads:on -r src/mercury.nim

prod:
	nim c --threads:on -d:danger src/mercury.nim && ./src/mercury
