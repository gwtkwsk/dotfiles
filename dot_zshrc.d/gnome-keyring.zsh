export XDG_RUNTIME_DIR="${XDG_RUNTIME_DIR:-/tmp/runtime-$USER}"
if [ ! -d "$XDG_RUNTIME_DIR" ]; then
    mkdir -p "$XDG_RUNTIME_DIR"
    chmod 0700 "$XDG_RUNTIME_DIR"
fi

if [ -z "$DBUS_SESSION_BUS_ADDRESS" ]; then
    eval "$(dbus-launch --sh-syntax)"
fi

if [ -z "$GNOME_KEYRING_CONTROL" ]; then
    eval "$(gnome-keyring-daemon --start --components=pkcs11,secrets,ssh 2>/dev/null)"
    export SSH_AUTH_SOCK
fi
