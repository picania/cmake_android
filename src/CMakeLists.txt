add_library(hellojni SHARED
    nativemain.cpp
    jnientrypoint.cpp
)

set_target_properties(hellojni
    PROPERTIES LIBRARY_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/android/jni/${ANDROID_ABI}
)
