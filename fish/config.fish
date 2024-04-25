if status is-interactive
    # Commands to run in interactive sessions can go here
    starship init fish | source
end

set -gx LS_COLORS "$LS_COLORS:ow=1;34:"
