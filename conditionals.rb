# Условия: стандартный if/else :)
12.times do
    die = dice 20 #можно кинуть кубик
    if die > 10 
        sample :drum_heavy_kick
    else 
        sample :drum_cymbal_closed
    sleep 0.5
    end
end