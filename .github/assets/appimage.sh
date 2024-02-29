BINNAME=rpcsx
curl -sSfL https://github.com/AppImage/AppImageKit/releases/download/continuous/appimagetool-x86_64.AppImage -o appimagetool
curl -sSfL https://github.com/linuxdeploy/linuxdeploy/releases/download/continuous/linuxdeploy-x86_64.AppImage -o linuxdeploy
curl -sSfL https://github.com/linuxdeploy/linuxdeploy-plugin-qt/releases/download/continuous/linuxdeploy-plugin-qt-x86_64.AppImage -o linuxdeployqt
curl -sSfL https://github.com/linuxdeploy/linuxdeploy-plugin-checkrt/releases/download/continuous/linuxdeploy-plugin-checkrt-x86_64.sh -o checkrt


mkdir -p AppDir/usr/bin
cp -r build/bin AppDir/usr/
cp ci/.github/assets/AppRun AppDir/ 
cp ui/rpcsx-ui AppDir/usr/bin/
cp -r ui/mangohud/usr AppDir/
#ln -sr AppDir/usr/bin/rpcsx-ui AppDir/AppRun
#cp /usr/bin/yad AppDir/usr/bin/
chmod +x AppDir/usr/bin
chmod +x AppDir/AppRun

chmod a+x appimagetool linuxdeploy linuxdeployqt checkrt
#export NO_STRIP=1 
ARCH=x86_64 ./linuxdeploy --appdir=AppDir
ARCH=x86_64 ./checkrt --appdir AppDir/

cp -r build/bin AppDir/usr/
cp ci/.github/assets/${BINNAME}.png AppDir/
cp ci/.github/assets/${BINNAME}.desktop AppDir/
mkdir -p AppDir/usr/share/applications && cp ./AppDir/${BINNAME}.desktop ./AppDir/usr/share/applications
mkdir -p AppDir/usr/share/icons && cp ./AppDir/${BINNAME}.png ./AppDir/usr/share/icons
mkdir -p AppDir/usr/share/icons/hicolor/512x512/apps && cp ./AppDir/${BINNAME}.png ./AppDir/usr/share/icons/hicolor/512x512/apps

QMAKE=/usr/lib/qt6/bin/qmake ARCH=x86_64 ./linuxdeployqt --appdir AppDir/
ARCH=x86_64 ./appimagetool AppDir/ ${BINNAME}.AppImage
