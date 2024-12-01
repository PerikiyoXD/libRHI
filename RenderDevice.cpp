//////////////////////////////////////////////////////////////////////////////
// This file is part of the Maple Engine                              		//
//////////////////////////////////////////////////////////////////////////////
#include "RenderDevice.h"

#ifdef MAPLE_VULKAN
#include "Vulkan/VulkanRenderDevice.h"
#endif

#ifdef MAPLE_OPENGL
#include "OpenGL/GLRenderDevice.h"
#endif


namespace maple
{
	auto RenderDevice::get() -> std::shared_ptr<RenderDevice>
	{
		static std::shared_ptr<RenderDevice> device;

#ifdef MAPLE_VULKAN
		if (!device) {
			device = std::make_shared<VulkanRenderDevice>();
		}
#endif // MAPLE_VULKAN

#ifdef MAPLE_OPENGL
		if (!device) {
			device = std::make_shared<GLRenderDevice>();
		}
#endif

		return device;
	}
} // namespace maple