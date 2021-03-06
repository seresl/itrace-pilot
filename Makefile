all: Example.exe Utils.dll UtilsTest.exe GenGazeToSourceDump.exe SimpleGraph.exe SourceFileGazePath.exe

Example.exe:
	gmcs Example.cs -out:build/Example.exe

Utils.dll: utils/*.cs
	gmcs utils/*.cs -target:library -out:build/Utils.dll

UtilsTest.exe: Utils.dll
	gmcs UtilsTest.cs -r:build/Utils.dll -out:build/UtilsTest.exe

GenGazeToSourceDump.exe: Utils.dll
	gmcs GenGazeToSourceDump.cs -r:build/Utils.dll -out:build/GenGazeToSourceDump.exe

SimpleGraph.exe: SimpleGraph.cs Utils.dll
	mcs SimpleGraph.cs -r:build/Utils.dll -out:build/SimpleGraph.exe

SourceFileGazePath.exe: Utils.dll
	gmcs SourceFileGazePath.cs -r:build/Utils.dll -out:build/SourceFileGazePath.exe
