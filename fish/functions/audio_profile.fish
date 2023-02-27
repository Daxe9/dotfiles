#!/bin/fish
function swap_profile
    set audio_1 "a2dp_sink"
    set audio_2 "handsfree_head_unit"

    printf "1. %s\n2. %s\n" $audio_1 $audio_2
    read -l -P "Select profile [1/2]: " choice

    switch $choice
        case 1
            pactl set-card-profile bluez_card.00_1B_66_C8_64_E2 $audio_1
        case 2
            pactl set-card-profile bluez_card.00_1B_66_C8_64_E2 $audio_2
        case '*'
            echo "Invalid choice"
    end
end

