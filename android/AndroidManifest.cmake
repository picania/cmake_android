set(MANIFEST_PACKAGE "com.example.hellojni")
set(MANIFEST_VERSION_CODE "2")
set(MANIFEST_VERSION_NAME "2.0")
set(MANIFEST_MIN_SDK_VERSION 9)
set(MANIFEST_APP_DEBUGGABLE TRUE)
set(MANIFEST_APP_ACTIVITY "HelloJni")

configure_file(${CMAKE_SOURCE_DIR}/cmake/templates/AndroidManifest.xml.in ${CMAKE_CURRENT_SOURCE_DIR}/AndroidManifest.xml @ONLY)

