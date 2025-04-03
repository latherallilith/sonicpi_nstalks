#Простой трек для примера

use_debug true
g_sleep = 5
g_phase = 0.4
cue_sleep = 0.5

#meeeow
in_thread do
  loop do
    cue :guit
    with_fx :distortion do
      sample [:guit_harmonics, :guit_em9, :guit_e_slide].choose, amp: (line 0, 5, steps: 5).tick
      sleep 1
    end
  end
end

live_loop :drums do
  loop do
    die = dice 20
    if die > 5 && die < 10
      sample :drum_heavy_kick, amp: 1.5, release: rrand(1, 2)
      sleep [1, 0.5, 2, 1, 0.4].choose
    elsif die > 10 && die < 15
      sample :drum_cymbal_hard, amp: 1, attack: 0.5, sustain: rrand(0.1, 1)
      sleep [1,2,0.5].choose
    else
      sample :drum_bass_hard, amp: 1, attack: 1, decay: rrand(0.1, 1)
      sleep [1,2,0.5].choose
    end
  end
end



live_loop :acid do
  cue :foo
  with_fx :autotuner do
    loop do |i|
      use_random_seed 656
      128.times do
        use_synth :tb303
        play chord(:a3, :sus4, :add9, :madd9, :dim7,  :minor, :augumented, :major).choose,
          cutoff: rrand(40, 100), amp: 0.5, attack: 0, release: rrand(1, 2),
          cutoff_max: 110
        sleep 0.5
      end
    end
  end
  
  cue :bar
  loop do |i|
    use_synth :tb303
    play chord(:a3, :minor, :dim7, :minor).choose, attack: 0, release: 0.05, cutoff: rrand_i(70, 80) + i, res: rrand(0.7, 0.95)
    sleep 0.5
  end
  
  cue :baz
  with_fx :reverb, mix: 0.7 do |r|
    with_fx(:echo, delay: 0.8041, decay: 0.5) do
      68.times do |m|
        control r, mix: 0.7 + (0.5 * (m.to_f / 64.0)) unless m == 0 if m % 2 == 0
        use_synth :prophet
        play chord((ring '+5', 'm7b5', '1', :major7, :e3, :minor).mirror.shuffle()).choose,
          attack: 0, release: 0.08, cutoff: rrand_i(110, 130)
        sleep 0.125
      end
    end
  end
  
  cue :quux
  in_thread do
    loop do
      use_random_seed 601
      with_fx :distortion, phase: g_phase do
        8.times do
          use_synth :tb303
          play chord(:e3, :minor).choose,
            attack: 0.5, release: 0.1, cutoff: rrand(50, 70)
          sleep 0.25
        end
      end
    end
  end
  sleep g_sleep
end

in_thread do
  loop do
    cue [:foo, :bar, :baz, :guit, :baz, :bar, :guit, :foo, :quux].choose
    sleep cue_sleep
  end
end