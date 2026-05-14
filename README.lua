script_name(GodModeCar")
script_author("Kaizer")
script_version("1.0")

local activo = false

function main()
    if not isSampLoaded() then return end
    while not isSampAvailable() do wait(100) end
    
    sampRegisterChatCommand("chh", function()
        activo = not activo
        local mensaje = activo and "{00ff00}[GMC]: Activado" or "{ff0000}[GMC]: Desactivado"
        sampAddChatMessage(mensaje, -1)
    end)
    
    while true do
        wait(10)
        if activo and isCharInAnyCar(PLAYER_PED) then
            local veh = storeCarCharIsInNoSave(PLAYER_PED)
            
            -- Reparación técnica constante
            setCarHealth(veh, 1000)
            
            -- Inmunidad básica (Balas, Fuego, Explosiones, Choques)
            -- Esta es la forma más estable de evitar que el auto explote
            setCarProofs(veh, true, true, true, true, true)
            
            -- Mantiene el motor encendido si llegara a fallar
            if getCarHealth(veh) < 250 then
                fixCar(veh)
            end
        end
    end
end
tCarHealth(veh) < 250 then
                fixCar(veh)
            end
        end
    end
end

