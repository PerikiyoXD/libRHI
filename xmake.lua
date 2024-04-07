add_rules("mode.debug", "mode.release")

set_languages("cxx17")

add_requires("vulkan-headers")
add_requires("glslang")
add_requires("spdlog")
add_requires("spirv-cross")
add_requires("imgui", {configs = {vulkan = true, glfw = true}})
add_requires("vulkan-memory-allocator")

local libRHI_sources = {
    "src/AccelerationStructure.cpp",
    "src/BatchTask.cpp",
    "src/BufferLayout.cpp",
    "src/Console.cpp",
    "src/DescriptorPool.cpp",
    "src/DescriptorSet.cpp",
    "src/GPUBuffer.cpp",
    "src/GraphicsContext.cpp",
    "src/ImageConvert.cpp",
    "src/RenderDevice.cpp",
    "src/Shader.cpp",
    "src/ShaderCompiler.cpp",
    "src/SimdChecker.cpp",
    "src/StringUtils.cpp",
    "src/Textures.cpp",
    "src/Tweak/Tweakable.cpp",
    "src/Vulkan/VkCommon.cpp",
    "src/Vulkan/VKImGuiRenderer.cpp",
    "src/Vulkan/VulkanBatchTask.cpp",
    "src/Vulkan/VulkanBuffer.cpp",
    "src/Vulkan/VulkanCommandBuffer.cpp",
    "src/Vulkan/VulkanCommandPool.cpp",
    "src/Vulkan/VulkanComputePipeline.cpp",
    "src/Vulkan/VulkanContext.cpp",
    "src/Vulkan/VulkanDebug.cpp",
    "src/Vulkan/VulkanDescriptorPool.cpp",
    "src/Vulkan/VulkanDescriptorSet.cpp",
    "src/Vulkan/VulkanDevice.cpp",
    "src/Vulkan/VulkanFence.cpp",
    "src/Vulkan/VulkanFrameBuffer.cpp",
    "src/Vulkan/VulkanHelper.cpp",
    "src/Vulkan/VulkanIndexBuffer.cpp",
    "src/Vulkan/VulkanPipeline.cpp",
    "src/Vulkan/VulkanRenderDevice.cpp",
    "src/Vulkan/VulkanRenderPass.cpp",
    "src/Vulkan/VulkanSampler.cpp",
    "src/Vulkan/VulkanShader.cpp",
    "src/Vulkan/VulkanStorageBuffer.cpp",
    "src/Vulkan/VulkanSwapChain.cpp",
    "src/Vulkan/VulkanTexture.cpp",
    "src/Vulkan/VulkanUniformBuffer.cpp",
    "src/Vulkan/VulkanVertexBuffer.cpp",
    "src/Vulkan/Raytracing/RayTracingProperties.cpp",
    "src/Vulkan/Raytracing/ShaderBindingTable.cpp",
    "src/Vulkan/Raytracing/VulkanAccelerationStructure.cpp",
    "src/Vulkan/Raytracing/VulkanRaytracingPipeline.cpp"
}

target("libRHI")
    set_kind("static")
    add_files(libRHI_sources)
    add_includedirs("inc")
    add_packages("vulkan-headers", "glslang", "spdlog", "spirv-cross", "imgui", "vulkan-memory-allocator")
    add_defines("MAPLE_VULKAN=1", "USE_VMA_ALLOCATOR=1")