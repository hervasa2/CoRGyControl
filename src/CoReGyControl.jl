module CoReGyControl
    using Sockets
    using Unitful
    import Sockets.connect

    const Value = Union{<:Real, Missing}
    const CORE_NETCOM  = ip"134.107.13.19"
    const CORE_TMCM3110_PORT = 2021
    include("Device/Device.jl")
    
    export CORE_NETCOM, CORE_TMCM3110_PORT, TMCM3110, Motor, list_motion_axis_parameters
end