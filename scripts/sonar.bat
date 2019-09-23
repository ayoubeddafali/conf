set pathMSBuild="C:\Program Files (x86)\MSBuild\14.0\Bin\msbuild.exe"
set pathSonarQubeExe="C:\jenkins\sonar-scanner-msbuild\SonarScanner.MSBuild.exe"
set nodeJsExe="C:\Program Files\nodejs\node.exe"
set solutionName=%1
set projectKey=%2
set projectName=%3
set projectVersion=%4
set branchName=%5

%pathSonarQubeExe% begin /k:"%projectKey%" /n:"%projectName%" /v:"%projectVersion%" /d:sonar.scanner.metadataFilePath="report-task.txt" /d:sonar.nodejs.executable=%nodeJsExe% /d:sonar.host.url="http://67.207.94.110:9000" /d:sonar.login="admin" /d:sonar.password="admin" 
%pathMSBuild% %solutionName% /t:rebuild /v:q /nologo
%pathSonarQubeExe% end /d:sonar.login="admin" /d:sonar.password="admin"

