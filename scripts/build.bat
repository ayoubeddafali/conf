set pathMSBuild="C:\Program Files (x86)\MSBuild\14.0\Bin\MSBuild.exe"
set pathNuget="C:\jenkins\nuget.exe"
set solutionPath=%1

echo "pathMSBuild: %pathMSBuild%"
echo "pathNuget: %pathMSBuild%"
echo "solutionPath: %solutionPath%"

%pathMSBuild% %solutionPath% /t:Clean /v:q /nologo
%pathNuget% restore %solutionPath%
%pathMSBuild% %solutionPath% /t:Build /p:Configuration=Debug 
