include(AndroidManifest.cmake)

find_host_program(ANDROID_COMMAND NAMES android android.exe)
if(NOT ANDROID_COMMAND)
    message(WARNING "Could not find android tool. Add it to the path for upgrade/generate project.")
endif()

find_host_program(ANT_COMMAND NAMES ant ant.exe)
if(NOT ANT_COMMAND)
    message(WARNING "Could not find Apache ant build tool. Add it to the path for build android project.")
endif()

find_host_program(ADB_COMMAND NAMES adb adb.exe)
if(NOT ADB_COMMAND)
    message(WARNING "Could not find adb. Add it to the path if you want to use the deploy/run_apk targets")
endif()

# generate Android project
add_custom_command(
  OUTPUT build.xml
  DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/AndroidManifest.xml
  COMMAND ${ANDROID_COMMAND} update project -t android-${ANDROID_API_LEVEL} --name HelloGLES -p ${CMAKE_CURRENT_SOURCE_DIR}
)

add_custom_target(build_apk_debug
  #copy the library to obj, then strip the symbols from it
  DEPENDS build.xml hellogles
  COMMAND ${CMAKE_COMMAND} -E make_directory ${CMAKE_CURRENT_SOURCE_DIR}/obj/local/${ANDROID_ABI}
  COMMAND ${CMAKE_COMMAND} -E copy ${CMAKE_CURRENT_SOURCE_DIR}/jni/${ANDROID_ABI}/libhellogles.so ${CMAKE_CURRENT_SOURCE_DIR}/obj/local/${ANDROID_ABI}
  COMMAND ${ANT_COMMAND} debug
  WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
)
   
add_custom_target(build_apk_release
  DEPENDS build.xml
  COMMAND ${ANT_COMMAND} release
  WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
)

add_custom_target(deploy_debug_apk
  COMMAND ${ADB_COMMAND} uninstall com.example.hellogles
  COMMAND ${ADB_COMMAND} install -r ${CMAKE_CURRENT_SOURCE_DIR}/bin/HelloGLES-debug.apk
)

# include jni
include_directories(${CMAKE_SOURCE_DIR}/src)
add_subdirectory(jni)

