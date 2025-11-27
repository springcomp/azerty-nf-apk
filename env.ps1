$Env:JAVA_HOME="C:\Program Files\Android\Android Studio\jbr"
$Env:PATH="$($Env:PATH);$($Env:JAVA_HOME)\bin"
$ENV:ANDROID_SDK_ROOT="$Env:LOCALAPPDATA\Android\Sdk"
$ENV:ANDROID_HOME=$ENV:ANDROID_SDK_ROOT
$version = "36.1.0"

"$($ENV:ANDROID_HOME)/build-tools/$($version)", `
"$($ENV:ANDROID_HOME)/platform-tools" | Add-DirectoryToPath 
