echo "Uninstall: Ignore any error messages if deskterm is not installed or not running"
rm -r ~/.deskterm
echo "Stopping deskterm..."
tmux kill-session -t Deskterm
killall devilspie2
echo "Deleting devilspie and autostart configurations..."
rm ~/.config/devilspie2/deskterm.lua
rm ~/.config/autostart/deskterm_autostart.desktop
echo "Removing terminal profile..."
PROFILE_UUID="df2e173b-d4f4-402f-be7e-1e3248594e55"
NEW_PROFILE_LIST=$(python3 -c "import sys;orig=sys.argv[2].replace('[','').replace(']','').replace('\'','').split(', ');orig.remove(sys.argv[1]);print(orig)" "$PROFILE_UUID" "$(gsettings get org.gnome.Terminal.ProfilesList list)")
gsettings set org.gnome.Terminal.ProfilesList list "$NEW_PROFILE_LIST"
echo "Done uninstalling"
