# select chip
if (CHIP_AX650)
    message(STATUS "Chip type: AX650")
    add_definitions(-DCHIP_AX650)

    # bsp
    if(NOT BSP_MSP_DIR)
        set(BSP_MSP_DIR ${CMAKE_SOURCE_DIR}/ax650n_bsp_sdk/msp/out)
    endif()

    # opencv
    if(NOT OpenCV_DIR)
        set(OpenCV_DIR ${CMAKE_SOURCE_DIR}/third-party/libopencv-4.5.5-aarch64/lib/cmake/opencv4)
    endif()
elseif (CHIP_AX630C)
    message(STATUS "Chip type: AX630C")
    add_definitions(-DCHIP_AX630C)

    # bsp
    if(NOT BSP_MSP_DIR)
        set(BSP_MSP_DIR ${CMAKE_SOURCE_DIR}/ax620q_bsp_sdk/msp/out/arm64_glibc)
    endif()

    # opencv
    if(NOT OpenCV_DIR)
        set(OpenCV_DIR ${CMAKE_SOURCE_DIR}/third-party/opencv/lib/arm64/glibc/cmake/opencv4)
    endif()
elseif (CHIP_AX620Q)
    message(STATUS "Chip type: AX620Q")
    add_definitions(-DCHIP_AX620Q)

    # bsp
    if(NOT BSP_MSP_DIR)
        set(BSP_MSP_DIR ${CMAKE_SOURCE_DIR}/ax620q_bsp_sdk/msp/out/arm_uclibc)
    endif()

    # opencv
    if(NOT OpenCV_DIR)
        set(OpenCV_DIR ${CMAKE_SOURCE_DIR}/third-party/opencv/lib/arm/uclibc/cmake/opencv4)
    endif()
else()
    message(FATAL_ERROR "FATAL: Chip type not set!")
endif()

# check bsp exist
if(NOT EXISTS ${BSP_MSP_DIR})
    message(FATAL_ERROR "FATAL: BSP_MSP_DIR ${BSP_MSP_DIR} not exist")
endif()

message(STATUS "BSP_MSP_DIR = ${BSP_MSP_DIR}")
message(STATUS "OpenCV_DIR = ${OpenCV_DIR}")

set(MSP_INC_DIR ${BSP_MSP_DIR}/include)
set(MSP_LIB_DIR ${BSP_MSP_DIR}/lib)

list(APPEND MSP_LIBS
        ax_sys
        ax_proton
        ax_ivps
        ax_venc
        ax_engine
        ax_interpreter)