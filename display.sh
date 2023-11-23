#!/bin/bash
wget https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb
sudo dpkg -i chrome-remote-desktop_current_amd64.deb

sudo DEBIAN_FRONTEND=noninteractive \
    apt install --assume-yes cinnamon-core desktop-base dbus-x11
 
sudo bash -c 'echo "exec /etc/X11/Xsession /usr/bin/cinnamon-session-cinnamon2d" > /etc/chrome-remote-desktop-session'
sudo systemctl disable lightdm.service
DISPLAY= /opt/google/chrome-remote-desktop/start-host --code="4/0AfJohXkemIzQh-ggP6KP24UGmmdtTJLviy0c3sWmQah7SugABMnbu95D4b4mj_OO6ESUlQ" --redirect-url="https://remotedesktop.google.com/_/oauthredirect" --name=$(hostname)
