$Env:JAVA_HOME="C:\Program Files\Android\Android Studio\jbr"
$Env:PATH="$($Env:PATH);$($Env:JAVA_HOME)\bin"

New-Item -ItemType Directory -Force -Path .\app\keystore | Out-Null
keytool -genkeypair -v `
  -keystore .\app\keystore\release.jks `
  -storepass android -keypass android `
  -alias release -keyalg RSA -keysize 2048 -validity 10000 `
  -dname "CN=springcomp, OU=Development, O=Personal, L=Unknown, S=Unknown, C=FR"
