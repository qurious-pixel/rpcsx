include(FetchContent)
set(FETCHCONTENT_QUIET OFF)

FetchContent_Declare(
  glslang
  GIT_REPOSITORY "https://github.com/KhronosGroup/glslang.git"
  GIT_TAG "4c57db1595462c51d5080893f65c42fc1f318146"
  OVERRIDE_FIND_PACKAGE)
set(ENABLE_OPT off)
FetchContent_MakeAvailable(glslang)

FetchContent_Declare(
  VulkanHeaders
  GIT_REPOSITORY "https://github.com/KhronosGroup/Vulkan-Headers.git"
  GIT_TAG "v1.3.264"
  OVERRIDE_FIND_PACKAGE)
FetchContent_MakeAvailable(VulkanHeaders)

FetchContent_Declare(
  SPIRV-Headers
  GIT_REPOSITORY "https://github.com/KhronosGroup/SPIRV-Headers.git"
  GIT_TAG "d790ced752b5bfc06b6988baadef6eb2d16bdf96"
  OVERRIDE_FIND_PACKAGE)
#FetchContent_MakeAvailable(SPIRV-Headers)  
FetchContent_GetProperties(SPIRV-Headers)
if(NOT SPIRV-Headers_POPULATED)
  FetchContent_Populate(SPIRV-Headers)
  add_subdirectory(
    ${SPIRV-Headers_SOURCE_DIR}
    ${SPIRV-Headers_BINARY_DIR}
  )
endif()

FetchContent_Declare(
  SPIRV-Tools
  GIT_REPOSITORY "https://github.com/KhronosGroup/SPIRV-Tools.git"
  GIT_TAG "ee7598d49798e7bf34fabe55b5a438a381d450c8"
  OVERRIDE_FIND_PACKAGE)
set(SPIRV_WERROR off)
set(SPIRV_SKIP_TESTS on)
set(SPIRV_SKIP_EXECUTABLES on)
FetchContent_MakeAvailable(SPIRV-Tools)

FetchContent_Declare(spirv-cross
	GIT_REPOSITORY https://github.com/KhronosGroup/SPIRV-Cross.git
    GIT_TAG sdk-1.3.261.1
    GIT_PROGRESS ON)
FetchContent_MakeAvailable(spirv-cross)
include_directories(${spirv-cross_SOURCE_DIR})

#FetchContent_GetProperties(spirv-cross)
#if(NOT spirv-cross_POPULATED)
#  FetchContent_Populate(spirv-cross)
#  add_subdirectory(
#    ${spirv-cross_SOURCE_DIR}
#    ${spirv-cross_BINARY_DIR}
#  )
#endif()

