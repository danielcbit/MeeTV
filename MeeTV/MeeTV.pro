# Add more folders to ship with the application, here
folder_01.source = qml/MeeTV
folder_01.target = qml
DEPLOYMENTFOLDERS = folder_01

# Additional import path used to resolve QML modules in Creator's code model
QML_IMPORT_PATH =

symbian:TARGET.UID3 = 0xE3FF4947

# Smart Installer package's UID
# This UID is from the protected range and therefore the package will
# fail to install if self-signed. By default qmake uses the unprotected
# range value if unprotected UID is defined for the application and
# 0x2002CCCF value if protected UID is given to the application
#symbian:DEPLOYMENT.installer_header = 0x2002CCCF

# Allow network access on Symbian
symbian:TARGET.CAPABILITY += NetworkServices

CONFIG += link_pkgconfig
PKGCONFIG += gq-gconf

# If your application uses the Qt Mobility libraries, uncomment the following
# lines and add the respective components to the MOBILITY variable.
CONFIG += mobility
MOBILITY += systeminfo

# Speed up launching on MeeGo/Harmattan when using applauncherd daemon
CONFIG += qdeclarative-boostable

# Add dependency to Symbian components
# CONFIG += qt-components

QT       += network dbus

# The .cpp file which was generated for your project. Feel free to hack it.
SOURCES += main.cpp \
    meetv.cpp \
    meetvepgquery.cpp \
    meetvhtsp.cpp \
    meetvchannel.cpp \
    meetvevent.cpp \
    meetvtag.cpp \
    meetvtagmodel.cpp \
    meetvchannelmodel.cpp \
    meetveventmodel.cpp \
    meetvdvrentry.cpp \
    meetvdvrentrymodel.cpp \
    meetvsettings.cpp \
    meetvmodelhelper.cpp \
    meetvservice.cpp

# Please do not modify the following two lines. Required for deployment.
include(qmlapplicationviewer/qmlapplicationviewer.pri)
qtcAddDeployment()

HEADERS += meetv.h \
    meetvepgquery.h \
    meetvhtsp.h \
    meetvchannel.h \
    meetvevent.h \
    meetvtag.h \
    meetvtagmodel.h \
    meetvchannelmodel.h \
    meetveventmodel.h \
    meetvdvrentry.h \
    meetvdvrentrymodel.h \
    meetvsettings.h \
    meetvmodelhelper.h \
    meetvmodel.h \
    meetvservice.h

contains(MEEGO_EDITION,harmattan) {
    SOURCES += meetvsettingsgconf.cpp
    HEADERS += meetvsettingsgconf.h
} else {
    SOURCES += meetvsettingshard.cpp
    HEADERS += meetvsettingshard.h
}

settingsdesktop.path = /usr/share/duicontrolpanel/desktops
settingsdesktop.files = meetv_settings.desktop

settingsxml.path = /usr/share/duicontrolpanel/uidescriptions
settingsxml.files = meetv_settings.xml

OTHER_FILES += \
    meetv_settings.desktop \
    meetv_settings.xml

INSTALLS += settingsdesktop settingsxml

RESOURCES += \
    res.qrc

CONFIG(release, debug|release) {
    win32:CONFIG(release, debug|release): LIBS += -L$$OUT_PWD/../QHtsp/release/ -lQHtsp
    else:win32:CONFIG(debug, debug|release): LIBS += -L$$OUT_PWD/../QHtsp/debug/ -lQHtsp
    else:symbian: LIBS += -lQHtsp
    else:unix: LIBS += -L$$OUT_PWD/../QHtsp/ -lQHtsp

    INCLUDEPATH += $$PWD/../QHtsp
    DEPENDPATH += $$PWD/../QHtsp
} else {
    include(QHtsp.pri)
}

