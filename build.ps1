[CmdletBinding()]
param(
  [switch]$release
)

BEGIN {
  $Env:JAVA_HOME="C:\Program Files\Android\Android Studio\jbr"
  $Env:PATH="$($Env:PATH);$($Env:JAVA_HOME)\bin"
  $ENV:ANDROID_SDK_ROOT="$Env:LOCALAPPDATA\Android\Sdk"
  $ENV:ANDROID_HOME=$ENV:ANDROID_SDK_ROOT
  $version = "36.1.0"
}

PROCESS {

  . ./gradlew.bat assembleDebug --warning-mode all --no-daemon

  if ($release.IsPresent){
    . ./gradlew.bat clean assembleRelease
    . "$($Env:ANDROID_HOME)/build-tools/$($version)/zipalign.exe" -v -p 4 ./app/build/outputs/apk\release/springcomp.keyboard-layouts.azerty-nf-1.0.apk ./app/build/outputs/apk/release/app-release-aligned.apk
    . "$($Env:ANDROID_HOME)/build-tools/$($version)/apksigner.bat" sign --ks ./app/keystore/release.jks --ks-key-alias release --ks-pass pass:android --key-pass pass:android --out ./app/build/outputs/apk/release/app-release-signed.apk ./app/build/outputs/apk/release/app-release-aligned.apk
    . "$($Env:ANDROID_HOME)/build-tools/$($version)/apksigner.bat" verify --verbose ./app/build/outputs/apk/release/app-release-signed.apk
  }
}
