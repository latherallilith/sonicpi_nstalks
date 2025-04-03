
#Циклы loop для стандартного бесконечного цикла 
use_synth :rodeo

loop do
    if one_in(5)
        break #покидаем цикл в одном из пяти случаев
    else 
        play 50, amp: 0.5, release: 1
        play 53, amp: 0.3, release: 0.3 if one_in(2)
        play 57, amp: 0.6, release: 0.3 if one_in(3)
        play 60, amp: 0.6, release: 0.3 if one_in(5)
        sleep 1.5
    end
end