struct CoRGy <: Device
    name::String
    motor_controller::TMCM3110
    motor_horizontal::Motor
    motor_vertical::Motor
    motor_rotational::Motor
    
    function CoRGy(name::String,
                   motor_controller::TMCM3110,
                   motor_horizontal::Motor,
                   motor_vertical::Motor,
                   motor_rotational::Motor)
        if motor_horizontal.axis_type != :linear || motor_vertical.axis_type != :linear || motor_rotational.axis_type != :periodic
            @error "Incompatible motors"
        end
        new(name, motor_controller, motor_horizontal, motor_vertical, motor_rotational)
    end
    
    function Base.println(c::CoRGy)
        println()
        println("\t--- $(c.name) ---")
        println("\tMotor Controller = $(c.motor_controller.name)")
        println("\tHorizontal Motor = $(c.motor_horizontal.name)")
        println("\tVertical Motor = $(c.motor_vertical.name)")
        println("\tRotational Motor = $(c.motor_rotational.name)")
    end
    
    function Base.show(c::CoRGy) println(c) end
    function Base.display(c::CoRGy) println(c) end
end

function PosDegree(c::CoRGy)
    update_motor!(c.motor_rotational)
    c.motor_rotational.encoder_position
end

function PosHor(c::CoRGy)
    update_motor!(c.motor_horizontal)
    c.motor_horizontal.encoder_position
end

function PosVert(c::CoRGy)
    update_motor!(c.motor_vertical)
    c.motor_vertical.encoder_position
end