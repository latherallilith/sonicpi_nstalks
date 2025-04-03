
# Эффекты
#with_fx :reverb, mix: 0.7, depth: 1 do #Эффекты поддерживают список аргументов
# глянуть можно во вкладке help/FX
# loop do # важно создавать эффекты вне лупа а не внутри него
# sample :guit_e_fifths
#   sleep 1.125
#end
#end


use_synth :pluck

array_of_notes = [:D2, :C3, :E]

loop do
  if one_in(5)
    break #покидаем цикл в одном из пяти случаев
  else
    #индексация
    play array_of_notes.at(6)
    sleep 0.5
    #выбор рандомной ноты и уменьшение ее частоты через лямбду
    play choose([50, 70, 40, 60, 54].map{|a| a-20})
    sleep 1
    #рандомный рейт семпла (скорость проигрывания)
    sample :perc_bell, rate: rrand(0.125, 1.5), amp: 0.5
    sleep rrand(0.2, 2)
  end
end

use_synth :fm
#кольца возвращают значения циклически, возвращаясь к началу
#после достижения конца списка
notes = ring(:c4, :e4, :g4, :b4)
durations = ring(0.25, 0.5, 0.75, 1)

live_loop :random_melody do
  #tick увеличивает счётчик при каждом вызове
  play notes.tick, release: 0.3, amp: rrand(0.5, 1.5)
  #look просто получает текущее значение без изменения счётчика.
  sleep durations.look
end
