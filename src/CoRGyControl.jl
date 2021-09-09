module CoRGyControl
    using Sockets
    using Unitful
    using IntervalSets
    using ProgressMeter
    import Sockets.connect

    const Value = Union{<:Real, Missing}
    const CORGY_NETCOM  = ip"134.107.13.19"
    const CORGY_TMCM3110_PORT = 2021
    include("Device/Device.jl")

    export CORGY_NETCOM, CORGY_TMCM3110_PORT, TMCM3110, Motor, CoRGy, 
    list_all_axis_parameters, PosHor, PosVert, PosDegree, move, move_to, 
    update_motor!, calibrate_motor, get_axis_parameter, update_motor_position!
end
