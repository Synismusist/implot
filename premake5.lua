project "ImPlot"
	kind "StaticLib"
	language "C++"
    staticruntime "off"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"implot.h",
		"implot.cpp",
		"implot_items.cpp",
		"implot_internal.h",
	}

	includedirs
	{ 
	   "../../Walnut/vendor/imgui",
	   "../../Walnut/vendor/glfw/include",
	   "../../Walnut/vendor/stb_image",
 
	   "%{IncludeDir.VulkanSDK}",
	   "%{IncludeDir.glm}",
	   "%{IncludeDir.spdlog}",
	}
 
	links
	{
		"ImGui",
	}

	filter "system:windows"
		systemversion "latest"
		cppdialect "C++17"

	filter "system:linux"
		pic "On"
		systemversion "latest"
		cppdialect "C++17"

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"

    filter "configurations:Dist"
		runtime "Release"
		optimize "on"
        symbols "off"
