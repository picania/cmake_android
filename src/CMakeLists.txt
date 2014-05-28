add_library(nativemain STATIC
    nativemain.cpp
)

### redefined library output path
set_target_properties(nativemain
    PROPERTIES ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/android/libs/${ANDROID_ABI}
)
