$Env:JAVA_HOME="C:\Program Files\Android\Android Studio\jbr"
$Env:PATH="$($Env:PATH);$($Env:JAVA_HOME)\bin"
. ./gradlew.bat assembleDebug --warning-mode all --no-daemon
