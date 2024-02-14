include(FetchContent)
set(FETCHCONTENT_QUIET OFF)
   
FetchContent_Declare(spirv-cross
	GIT_REPOSITORY https://github.com/KhronosGroup/SPIRV-Cross.git
    GIT_TAG sdk-1.3.261.1
    GIT_PROGRESS ON)
