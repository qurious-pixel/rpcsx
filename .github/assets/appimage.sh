BINNAME=rpcsx
curl -sSfL https://github.com/AppImage/AppImageKit/releases/download/continuous/appimagetool-x86_64.AppImage -o appimagetool
curl -sSfL https://github.com/linuxdeploy/linuxdeploy/releases/download/continuous/linuxdeploy-x86_64.AppImage -o linuxdeploy

mkdir -p AppDir/usr/bin
cp -r build/bin AppDir/usr/
cp ci/.github/assets/AppRun AppDir/
chmod +x AppDir/usr/bin
chmod +x AppDir/AppRun

chmod a+x appimagetool linuxdeploy
ARCH=x86_64 ./linuxdeploy --appdir=AppDir

cp ci/.github/assets/${BINNAME}.png AppDir/
cp ci/.github/assets/${BINNAME}.desktop AppDir/
mkdir -p AppDir/usr/share/applications && cp ./AppDir/${BINNAME}.desktop ./AppDir/usr/share/applications
mkdir -p AppDir/usr/share/icons && cp ./AppDir/${BINNAME}.png ./AppDir/usr/share/icons
mkdir -p AppDir/usr/share/icons/hicolor/512x512/apps && cp ./AppDir/${BINNAME}.png ./AppDir/usr/share/icons/hicolor/512x512/apps

ARCH=x86_64 ./appimagetool AppDir/ ${BINNAME}.AppImage
