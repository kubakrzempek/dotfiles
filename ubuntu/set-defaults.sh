# Sets things how I like in Ubuntu.
#
# Run ./set-defaults.sh and you'll be good to go.

echo "> Sets Ubuntu interface"
echo "> Hide battery icon from bar when not in use."
gsettings set com.canonical.indicator.power icon-policy 'charge'
gsettings set com.canonical.indicator.power show-time true

echo "> Disable username on indicator."
gsettings set com.canonical.indicator.session show-real-name-on-panel false

# Below are keybindings SPECIFIC for Lenovo X1 Carbon to control medias
# via F9-12 keys.
echo "> Remap F9-F12 keys to support media players"
gsettings set org.gnome.settings-daemon.plugins.media-keys play 'Tools'
gsettings set org.gnome.settings-daemon.plugins.media-keys stop 'Search'
gsettings set org.gnome.settings-daemon.plugins.media-keys previous 'LaunchA'
gsettings set org.gnome.settings-daemon.plugins.media-keys next 'Explorer'

echo "> Set lid closing actions"
gsettings set org.gnome.settings-daemon.plugins.power lid-close-ac-action 'nothing'
gsettings set org.gnome.settings-daemon.plugins.power lid-close-battery-action 'nothing'

echo "> Set touchpad things"
gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click false
gsettings set org.gnome.desktop.peripherals.touchpad send-events 'enabled'
