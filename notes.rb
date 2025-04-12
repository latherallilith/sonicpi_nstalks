sleep 0.4 # пауза в секундах
play :E2, amp: 0.8 #после алиаса ноты указывается номер октавы
sleep 0.4
play :C3, amp: 0.5 # громкость от 0 до 1
play :E4, amp: 1, pan: -1 # левый динамик
sleep 0.5
play :C2, amp: 0.1, pan: 0 #центрировано
sleep 0.5
play :G2, amp: 1, pan: 1 # правый динамик
sleep 0.5
#аккорды

use_synth :piano

play chord(:E3, :m7)
sleep 0.5
play chord(:E3, :minor)
sleep 0.5
play chord(:E3, :dim7)
sleep 0.5
play chord(:E3, :dom7)

#играет ноты в списке с вызовом sleep 1 после каждой
play_pattern chord(:E3, :m7)
sleep 0.5
#играет ноты в списке с вызовом sleep 0.25 после каждой
play_pattern_timed chord(:E3, :m7), 0.25
sleep 0.5
#играет гамму
play_pattern_timed (scale :e3, :minor_pentatonic), 0.5