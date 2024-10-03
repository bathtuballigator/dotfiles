# start vesktop - rules make this spawn in the special workspace 
vesktop --enable-features=WaylandWindowDecorations --ozone-platform-hint=auto &
# start spotify player
kitty spotify_player &
sleep 1 # sleep lines give time for windows to finish launching b4 rules
        # take effect

# start geekos tmux in workspace 5
hyprctl keyword windowrulev2 workspace 5, "title:^(tmux)"
kitty ~/geekos/tmux_geekos.sh &
sleep 1
hyprctl keyword windowrulev2 unset, "title:^(tmux)"
