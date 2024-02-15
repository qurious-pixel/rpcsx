include(FetchContent)
set(FETCHCONTENT_QUIET OFF)

FetchContent_Declare(
  VulkanHeaders
  GIT_REPOSITORY "https://github.com/KhronosGroup/Vulkan-Headers.git"
  GIT_TAG "v1.3.264"
  OVERRIDE_FIND_PACKAGE)
FetchContent_MakeAvailable(VulkanHeaders)

FetchContent_Declare(spirv-cross
	GIT_REPOSITORY https://github.com/KhronosGroup/SPIRV-Cross.git
    GIT_TAG sdk-1.3.261.1
    GIT_PROGRESS ON)
FetchContent_MakeAvailable(spirv-cross)
include_directories(${spirv-cross_SOURCE_DIR})


