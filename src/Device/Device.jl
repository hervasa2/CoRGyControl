abstract type Device end

connect(device::Device) = connect(device.ip, device.port)

include("Trinamic.jl")
include("Motor.jl")