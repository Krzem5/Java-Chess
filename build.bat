@echo off
cls
if exist build rmdir /s /q build
mkdir build
cd src
javac -d ../build com/krzem/chess/Main.java&&jar cvmf ../manifest.mf ../build/chess.jar -C ../build *&&goto run
cd ..
goto end
:run
cd ..
pushd "build"
for /D %%D in ("*") do (
	rd /S /Q "%%~D"
)
for %%F in ("*") do (
	if /I not "%%~nxF"=="chess.jar" del "%%~F"
)
popd
cls
java -jar build/chess.jar
:end
