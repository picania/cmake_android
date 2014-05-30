set(MANIFEST_PACKAGE "com.example.hellogles")
set(MANIFEST_VERSION_CODE "1")
set(MANIFEST_VERSION_NAME "1.0")
set(MANIFEST_MIN_SDK_VERSION 9)
set(MANIFEST_TARGET_SDK_VERSION ${ANDROID_API_LEVEL})
set(MANIFEST_APP_DEBUGGABLE TRUE)
set(MANIFEST_APP_ACTIVITY "HelloGLES")

configure_file(${CMAKE_SOURCE_DIR}/cmake/templates/AndroidManifest.xml.in ${CMAKE_CURRENT_SOURCE_DIR}/AndroidManifest.xml @ONLY)

