sudo apt install devilspie2 tmux python3 nvtop
echo Installed dependencies
PROFILE_UUID="df2e173b-d4f4-402f-be7e-1e3248594e55"
NEW_PROFILE_LIST=$(python3 -c "import sys;orig=sys.argv[2].replace('[','').replace(']','').replace('\'','').split(', ');orig.append(sys.argv[1]);filt=[i for n, i in enumerate(orig) if i not in orig[:n]];print(filt)" "$PROFILE_UUID" "$(gsettings get org.gnome.Terminal.ProfilesList list)")
echo "New profile list: \"$NEW_PROFILE_LIST\""
gsettings set org.gnome.Terminal.ProfilesList list "$NEW_PROFILE_LIST"
dconf load /org/gnome/terminal/legacy/profiles:/:$PROFILE_UUID/ < $(dirname $0)/resources/profile.conf
echo Installed Deskterm profile
mkdir -p ~/.deskterm/scripts
cp $(dirname $0)/resources/deskterm.lua ~/.config/devilspie2/deskterm.lua
# Copy pane scripts
cp $(dirname $0)/resources/scripts/*.sh ~/.deskterm/scripts/
# Copy startup scripts
cp $(dirname $0)/resources/startup.sh ~/.deskterm/
# Copy autostart entry
cp $(dirname $0)/resources/deskterm_autostart.desktop ~/.config/autostart/
# Copy uninstall file
cp $(dirname $0)/uninstall.sh ~/.deskterm/
# Copy misc
cp $(dirname $0)/resources/colorize.sh ~/.deskterm/
echo Copied files
# Add permissions for scripts
chmod +x ~/.deskterm/scripts/*.sh
chmod +x ~/.deskterm/*.sh
echo Fixed script permissions
echo Done installing
echo Launching deskterm...
~/.deskterm/startup.sh
echo Done
