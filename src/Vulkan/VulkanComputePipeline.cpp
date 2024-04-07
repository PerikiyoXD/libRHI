//////////////////////////////////////////////////////////////////////////////
// This file is part of the Maple Engine                              		//
//////////////////////////////////////////////////////////////////////////////
#include "Vulkan/VulkanComputePipeline.h"
#include "Vulkan/VulkanCommandBuffer.h"
#include "Vulkan/VulkanContext.h"
#include "Vulkan/VulkanDescriptorSet.h"
#include "Vulkan/VulkanDevice.h"
#include "Vulkan/VulkanFrameBuffer.h"
#include "Vulkan/VulkanRenderPass.h"
#include "Vulkan/VulkanShader.h"
#include "Vulkan/VulkanSwapChain.h"
#include "Vulkan/VulkanTexture.h"
#include "Console.h"
#include <memory>


namespace maple
{
	VulkanComputePipeline::VulkanComputePipeline(const PipelineInfo &info)
	{
		init(info);
	}

	auto VulkanComputePipeline::init(const PipelineInfo &info) -> bool
	{
		PROFILE_FUNCTION();
		shader         = info.shader;
		auto vkShader  = std::static_pointer_cast<VulkanShader>(info.shader);
		description    = info;
		pipelineLayout = vkShader->getPipelineLayout();

		VkComputePipelineCreateInfo computePipelineCreateInfo{};
		computePipelineCreateInfo.sType  = VK_STRUCTURE_TYPE_COMPUTE_PIPELINE_CREATE_INFO;
		computePipelineCreateInfo.layout = pipelineLayout;
		computePipelineCreateInfo.flags  = 0;
		computePipelineCreateInfo.stage  = vkShader->getShaderStages()[0];
		VK_CHECK_RESULT(vkCreateComputePipelines(*VulkanDevice::get(),
		                                         VulkanDevice::get()->getPipelineCache(), 1,
		                                         &computePipelineCreateInfo, nullptr, &pipeline));

		VulkanHelper::setObjectName(info.pipelineName, (uint64_t) pipeline, VK_OBJECT_TYPE_PIPELINE);
		return true;
	}

	auto VulkanComputePipeline::bind(const CommandBuffer *cmdBuffer, uint32_t layer, int32_t cubeFace, int32_t mipMapLevel) -> FrameBuffer *
	{
		PROFILE_FUNCTION();
		vkCmdBindPipeline(static_cast<const VulkanCommandBuffer *>(cmdBuffer)->getCommandBuffer(),
		                  VK_PIPELINE_BIND_POINT_COMPUTE,
		                  pipeline);
		return nullptr;
	}
};        // namespace maple
