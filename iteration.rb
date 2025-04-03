# Блоки и итераторы, так же, как и в обычном руби
5.times do
    use_synth :bass_foundation
    play :C3, attack: 0.4, amp: 1, decay: 1
    sleep 1
end

3.times do
    use_synth :blade
    play :C3, attack: 0.4, amp: 1,attack: 0.2, 
    sustain: 1, decay: 1, release: 0.5
    sleep 1
end


