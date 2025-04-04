
#Можно обрабатывать звук с микрофона
with_fx :distortion do |dist|
    live_audio :voice
    control dist, mix: 0.9, attack: 100, release: 0.3
  end
  
  
  #Брейкбит :)
  
  live_loop :idm_bb do
    n = [1,2,4,8,16].choose
    sample :drum_heavy_kick, amp: 2
    sample :ambi_drone, rate: [0.4, 0.5, 0.125, 1].choose, amp: 0.55 if one_in(8)
    sample :ambi_lunar_land, rate: [0.5, 0.125, 1, -1, -0.5].choose, amp: 0.25 if one_in(8)
    sample :loop_amen, attack: 0, release: 0.05, start: 1 - (1.0 / n), rate: [1,1,1,1,1,1,-1].choose
    sleep sample_duration(:loop_amen) / n
  end