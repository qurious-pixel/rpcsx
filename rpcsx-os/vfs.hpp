#pragma once

#include "orbis/error/SysResult.hpp"
#include "orbis/file.hpp"
#include "orbis/utils/Rc.hpp"
#include <filesystem>

struct IoDevice;

namespace rx::vfs
{
	void initialize();
	void deinitialize();
	void addDevice(std::string name, IoDevice* device);
	orbis::SysResult mount(const std::filesystem::path& guestPath, IoDevice* dev);
	orbis::SysResult open(std::string_view path, int flags, int mode,
		orbis::Ref<orbis::File>* file, orbis::Thread* thread);
	orbis::SysResult mkdir(std::string_view path, int mode, orbis::Thread* thread);
	orbis::SysResult rmdir(std::string_view path, orbis::Thread* thread);
	orbis::SysResult rename(std::string_view from, std::string_view to, orbis::Thread* thread);
} // namespace rx::vfs
