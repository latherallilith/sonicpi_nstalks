# Эффекты
with_fx :reverb, mix: 0.7, depth: 1 do #Эффекты поддерживают список аргументов
    # глянуть можно во вкладке help/FX
    loop do # важно создавать эффекты вне лупа а не внутри него
      sample :guit_e_fifths
      sleep 1.125
    end
  end