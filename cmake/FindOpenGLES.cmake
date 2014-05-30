#
#   Copyright 2013 Pixar
#
#   Licensed under the Apache License, Version 2.0 (the "Apache License")
#   with the following modification; you may not use this file except in
#   compliance with the Apache License and the following modification to it:
#   Section 6. Trademarks. is deleted and replaced with:
#
#   6. Trademarks. This License does not grant permission to use the trade
#      names, trademarks, service marks, or product names of the Licensor
#      and its affiliates, except as required to comply with Section 4(c) of
#      the License and to reproduce the content of the NOTICE file.
#
#   You may obtain a copy of the Apache License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the Apache License with the above modification is
#   distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
#   KIND, either express or implied. See the Apache License for the specific
#   language governing permissions and limitations under the Apache License.
#

# - Try to find OpenGLES
# Once done this will define
#  
#  OPENGLES_FOUND        - system has OpenGLES
#  OPENGLES_INCLUDE_DIR  - the GL include directory
#  OPENGLES_LIBRARIES    - Link these to use OpenGLES

if(ANDROID)
    find_path(OPENGLES_INCLUDE_DIR
        GLES2/gl2.h
        "${ANDROID_STANDALONE_TOOLCHAIN}/usr/include"
    )

    find_library(OPENGLES_LIBRARIES
        NAMES GLESv2
        PATHS "${ANDROID_STANDALONE_TOOLCHAIN}/usr/lib"
    )
endif()

set(OPENGLES_FOUND "NO")
if(OPENGLES_LIBRARIES)
    set(OPENGLES_FOUND "YES")
endif()

include(FindPackageHandleStandardArgs)

find_package_handle_standard_args(OpenGLES DEFAULT_MSG
    OPENGLES_LIBRARIES
    OPENGLES_INCLUDE_DIR
)

mark_as_advanced(
    OPENGLES_INCLUDE_DIR
    OPENGLES_LIBRARIES
)
