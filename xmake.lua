
if is_config("platform", "VK") then
    add_requires("vulkansdk", "spdlog", "glfw")

    target("libRHI")
        set_kind("static")
        set_targetdir("build")

        -- Add source files
        add_files("*.cpp")
        add_files("Vulkan/*.cpp")
        add_files("Vulkan/Raytracing/*.cpp")

        -- Add include directories
        add_sysincludedirs(".", {public = true})
        add_sysincludedirs("../../skeleton/imgui", {public = true})
        
        -- Add package
        add_packages("vulkansdk", "spdlog", "glfw", {public = true})
        
        -- Handle platforms
        do_platform_logic()
    target_end()
end