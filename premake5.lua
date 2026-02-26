project "NVRHI-D3D11"
    kind "StaticLib"
    language "C++"
    cppdialect "C++20"

    targetdir("bin/" .. outputdir .. "/%{prj.name}")
    objdir("bin-int/" .. outputdir .. "/%{prj.name}")

    files {
        "include/nvrhi/d3d11.h",

        "src/common/dxgi-format.h",
        "src/common/dxgi-format.cpp",

        "src/d3d11/**.h",
        "src/d3d11/**.cpp"
    }

    includedirs {
        "include"
    }

    defines {
        "NOMINMAX"
    }

project "NVRHI-D3D12"
    kind "StaticLib"
    language "C++"
    cppdialect "C++20"

    targetdir("bin/" .. outputdir .. "/%{prj.name}")
    objdir("bin-int/" .. outputdir .. "/%{prj.name}")

    files {
        "include/nvrhi/d3d12.h",

        "src/common/dxgi-format.h",
        "src/common/dxgi-format.cpp",
        "src/common/versioning.h",

        "src/d3d12/**.h",
        "src/d3d12/**.cpp"
    }

    includedirs {
        "include",
        "thirdparty/DirectX-Headers/include"
    }

    defines {
        "NOMINMAX"
    }

project "NVRHI-Vulkan"
    kind "StaticLib"
    language "C++"
    cppdialect "C++20"

    targetdir("bin/" .. outputdir .. "/%{prj.name}")
    objdir("bin-int/" .. outputdir .. "/%{prj.name}")

    files {
        "include/nvrhi/vulkan.h",

        "src/common/versioning.h",

        "src/vulkan/**.h",
        "src/vulkan/**.cpp",
    }

    VULKAN_SDK = os.getenv("VULKAN_SDK")

    includedirs {
        "include",
        "%{VULKAN_SDK}/include"
    }

    defines {
        "VK_USE_PLATFORM_WIN32_KHR",
        "NOMINMAX"
    }

project "NVRHI"
    kind "StaticLib"
    language "C++"
    cppdialect "C++20"

    targetdir("bin/" .. outputdir .. "/%{prj.name}")
    objdir("bin-int/" .. outputdir .. "/%{prj.name}")

    files {
        "include/nvrhi/nvrhi.h",
        "include/nvrhi/nvhriHLSL.h",
        "include/nvrhi/utils.h",

        "include/nvrhi/common/containers.h",
        "include/nvrhi/common/misc.h",
        "include/nvrhi/common/resource.h",
        "include/nvrhi/common/aftermath.h",

        "src/common/**.h",
        "src/common/**.cpp",

        "src/validation/**.h",
        "src/validation/**.cpp",

        "tools/nvrhi.natvis"
    }

    includedirs {
        "include"
    }

    defines {
        "NOMINMAX"
    }

    links {
        "NVRHI-D3D11",
        "NVRHI-D3D12",
        "NVRHI-Vulkan",
    }
