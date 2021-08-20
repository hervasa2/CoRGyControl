module CoReGyControl
    using Sockets
    using Unitful
    import Sockets.connect

    const Value = Union{<:Real, Missing}
    include("Device/Device.jl")
end