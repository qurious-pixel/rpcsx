BINNAME=rpcsx
curl -sSfL https://github.com/AppImage/AppImageKit/releases/download/continuous/appimagetool-x86_64.AppImage -o appimagetool

mkdir -p AppDir/usr/bin
cp -r build/bin AppDir/usr/
chmod +x AppDir/usr/bin
ln -sr AppDir/usr/bin/${BINNAME} AppDir/AppRun

cp ci/.github/assets/${BINNAME}.png AppDir/
cp ci/.github/assets/${BINNAME}.desktop AppDir/
mkdir -p AppDir/usr/share/applications && cp ./AppDir/${BINNAME}.desktop ./AppDir/usr/share/applications
mkdir -p AppDir/usr/share/icons && cp ./AppDir/${BINNAME}.png ./AppDir/usr/share/icons
mkdir -p AppDir/usr/share/icons/hicolor/512x512/apps && cp ./AppDir/${BINNAME}.png ./AppDir/usr/share/icons/hicolor/512x512/apps

chmod a+x appimagetool
ARCH=x86_64 ./appimagetool AppDir/ ${BINNAME}.AppImage
