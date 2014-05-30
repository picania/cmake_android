find_package(OpenGLES REQUIRED)

include_directories(${OPENGLES_INCLUDE_DIR})
include_directories(include)

add_library(glew STATIC
    glew.c
)

set_target_properties(glew
    PROPERTIES LIBRARY_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
    COMPILE_DEFINITIONS "GLEW_NO_GLU;GLEW_STATIC"
)

add_library(hellogles SHARED
    nativemain.cpp
    jnientrypoint.cpp
)

target_link_libraries(hellogles
    ${OPENGLES_LIBRARIES}
    glew
    log
)

set_target_properties(hellogles
    PROPERTIES LIBRARY_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/android/jni/${ANDROID_ABI}
    COMPILE_DEFINITIONS "GLEW_NO_GLU"
)
