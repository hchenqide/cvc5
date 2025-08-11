###############################################################################
# Top contributors (to current version):
#   Gereon Kremer
#
# This file is part of the cvc5 project.
#
# Copyright (c) 2009-2024 by the authors listed in the file AUTHORS
# in the top-level source directory and their institutional affiliations.
# All rights reserved.  See the file COPYING in the top-level source
# directory for licensing information.
# #############################################################################
#
# This file serves as a template for how the FindX.cmake scripts should work.
#
# Find MiniSatUP
# MiniSatUP_FOUND - system has MiniSatUP lib
# MiniSatUP_INCLUDE_DIR - the MiniSatUP include directory
# MiniSatUP_LIBRARIES - Libraries needed to use MiniSatUP
##

# provides some utility definitions
include(deps-helper)

# first look for the library using the standard procedures
find_path(MiniSatUP_INCLUDE_DIR NAMES minisatup.h)
find_library(MiniSatUP_LIBRARIES NAMES minisatup)

# check whether we found something
set(MiniSatUP_FOUND_SYSTEM FALSE)
if(MiniSatUP_INCLUDE_DIR AND MiniSatUP_LIBRARIES)
    set(MiniSatUP_FOUND_SYSTEM TRUE)
endif()

# not found
if(NOT MiniSatUP_FOUND_SYSTEM)
  check_ep_downloaded("MiniSatUP-EP")
  if(NOT MiniSatUP-EP_DOWNLOADED)
    check_auto_download("MiniSatUP" "")
  endif()

  include(ExternalProject)

  if("${CMAKE_GENERATOR}" STREQUAL "Unix Makefiles")
    # use $(MAKE) instead of "make" to allow for parallel builds
    set(make_cmd "$(MAKE)")
  else()
    # $(MAKE) does not work with ninja
    set(make_cmd "make")
  endif()

  set(MiniSatUP_SOURCE_DIR <SOURCE_DIR>)

  ExternalProject_Add(
    MiniSatUP-EP
    ${COMMON_EP_CONFIG}
    GIT_REPOSITORY https://github.com/hchenqide/minisat.git
    GIT_TAG minisatup-chrono
    CONFIGURE_COMMAND mkdir -p <SOURCE_DIR>/build
    COMMAND ${CMAKE_COMMAND} -S <SOURCE_DIR> -B <SOURCE_DIR>/build -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
    BUILD_COMMAND ${make_cmd} -C <SOURCE_DIR>/build
    INSTALL_COMMAND ${CMAKE_COMMAND} -E copy <SOURCE_DIR>/build/libminisatup.a <INSTALL_DIR>/lib/libminisatup.a
    COMMAND ${CMAKE_COMMAND} -E copy <SOURCE_DIR>/minisat/minisatup.h <INSTALL_DIR>/include/minisatup.h
    BUILD_BYPRODUCTS <INSTALL_DIR>/lib/libminisatup.a
  )

  set(MiniSatUP_INCLUDE_DIR "${DEPS_BASE}/include/")
  set(MiniSatUP_LIBRARIES "${DEPS_BASE}/lib/libminisatup.a")
endif()

set(MiniSatUP_FOUND TRUE)

add_library(MiniSatUP STATIC IMPORTED GLOBAL)
set_target_properties(
  MiniSatUP PROPERTIES IMPORTED_LOCATION "${MiniSatUP_LIBRARIES}"
)
set_target_properties(
  MiniSatUP PROPERTIES INTERFACE_SYSTEM_INCLUDE_DIRECTORIES "${MiniSatUP_INCLUDE_DIR}"
)

mark_as_advanced(MiniSatUP_FOUND)
mark_as_advanced(MiniSatUP_FOUND_SYSTEM)
mark_as_advanced(MiniSatUP_INCLUDE_DIR)
mark_as_advanced(MiniSatUP_LIBRARIES)

if(MiniSatUP_FOUND_SYSTEM)
  message(STATUS "Found MiniSatUP ${MiniSatUP_VERSION}: ${MiniSatUP_LIBRARIES}")
else()
  message(STATUS "Building MiniSatUP ${MiniSatUP_VERSION}: ${MiniSatUP_LIBRARIES}")
  add_dependencies(MiniSatUP MiniSatUP-EP)

  # Install MiniSatUP static library only if it is a static build.
  # The MiniSatUP static library is required to compile a program that
  # uses the cvc5 static library.
  if(NOT BUILD_SHARED_LIBS)
    install(FILES ${MiniSatUP_LIBRARIES} TYPE ${LIB_BUILD_TYPE})
  endif()
endif()
