VERSION = 1.0.0

QT       += core gui serialport network

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets


CONFIG += sdk_no_version_check

DEFINES += QT_DEPRECATED_WARNINGS

SOURCES += \
    autosplatoon.cpp \
    inputemulator.cpp \
    main.cpp \
    manualcontrol.cpp \
    serialcontroller.cpp

HEADERS += \
    autosplatoon.h \
    commonNames.h \
    inputemulator.h \
    manualcontrol.h \
    serialcontroller.h

FORMS += \
    autosplatoon.ui \
    manualcontrol.ui

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

ESPTOOL_BINARY_PATH = $$PWD/esptool
ESPTOOL_DEST_PATH = $$OUT_PWD/AutoSplatoon.app/Contents/MacOS/esptool

FIRMWARE_BINARY_PATH = $$PWD/PRO-UART0.bin
FIRMWARE_DEST_PATH = $$OUT_PWD/AutoSplatoon.app/Contents/MacOS/PRO-UART0.bin

QMAKE_POST_LINK += $$system(cp $$ESPTOOL_BINARY_PATH $$ESPTOOL_DEST_PATH);
QMAKE_POST_LINK += $$system(chmod +x $$ESPTOOL_DEST_PATH);
QMAKE_POST_LINK += $$system(cp $$FIRMWARE_BINARY_PATH $$FIRMWARE_DEST_PATH);

ICON_SOURCE_PATH = $$PWD/AutoSplatoon.icns
ICON_DEST_PATH = $$OUT_PWD/AutoSplatoon.app/Contents/Resources/AutoSplatoon.icns

QMAKE_POST_LINK += $$system(mkdir -p $$OUT_PWD/AutoSplatoon.app/Contents/Resources);
QMAKE_POST_LINK += $$system(cp $$ICON_SOURCE_PATH $$ICON_DEST_PATH);

RESOURCES += \
    Icons.qrc

DISTFILES += \
    AutoSplatoon.icns

ICON = AutoSplatoon.icns

