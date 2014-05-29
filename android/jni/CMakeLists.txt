add_library(hellojni SHARED
    entrypoint.cpp
)

set_target_properties(hellojni
    PROPERTIES LIBRARY_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/android/jni/${ANDROID_ABI}
)

target_link_libraries(hellojni
    nativemain
)

