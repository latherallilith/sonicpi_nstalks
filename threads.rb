#Треды и синхронизация

in_thread do
    loop do
        sample :drum_heavy_kick
        sleep 1
    end
end

#Cue позволяет нам посылать сообщения в соседний тред по ее имени
in_thread do
    loop do
        cue :tick
        sleep 1
    end
end