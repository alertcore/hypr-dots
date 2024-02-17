function fish_greeting
    if not set -q fish_greeting
        set -l line1 (_ 'Welcome to fish, the friendly interactive shell')
        set -l line2 \n(printf (_ 'Type %shelp%s for instructions on how to use fish') (set_color green) (set_color normal))
        set -g fish_greeting "$line1$line2"
    end

    if set -q fish_private_mode
        set -l line (_ "fish is running in private mode, history will not be persisted.")
        if set -q fish_greeting[1]
            set -g fish_greeting $fish_greeting\n$line
        else
            set -g fish_greeting $line
        end
    end
    neofetch --config /home/corn/.config/neofetch/smallfetch.conf
end
