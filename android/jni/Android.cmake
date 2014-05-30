set(JNI_MODULE_NAME hellogles)
set(JNI_MODULE_SOURCES ${ANDROID_ABI}/libhellogles.so)

configure_file(
    ${CMAKE_SOURCE_DIR}/cmake/templates/Android.mk.in
    ${CMAKE_CURRENT_SOURCE_DIR}/Android.mk
    @ONLY
)
