put 99-noto-overrides.conf $HOME/.var/app/com.brave.Browser/config/fontconfig/conf.d

It replaces all ugly rendering fonts with noto. I prfere seeing noto over these ugly fonts. They will only be applied to brave.


Made this for Fedora atomic /  bluefin
❯ cat /etc/os-release 
NAME="Bluefin"
VERSION="43.20251121 (Silverblue)"
RELEASE_TYPE=stable
ID=bluefin
ID_LIKE="fedora"
VERSION_ID=43
VERSION_CODENAME="Deinonychus"
PRETTY_NAME="Bluefin (Version: 43.20251121)"
ANSI_COLOR="0;38;2;60;110;180"
LOGO=fedora-logo-icon
CPE_NAME="cpe:/o:universal-blue:bluefin:43"
DEFAULT_HOSTNAME="bluefin"
HOME_URL="https://projectbluefin.io"
DOCUMENTATION_URL="https://docs.projectbluefin.io"
SUPPORT_URL="https://github.com/ublue-os/bluefin/issues/"
BUG_REPORT_URL="https://github.com/ublue-os/bluefin/issues/"
SUPPORT_END=2026-12-02
VARIANT="Silverblue"
VARIANT_ID=bluefin
OSTREE_VERSION='43.20251121'
BUILD_ID="f4652a7"
IMAGE_ID="bluefin"
IMAGE_VERSION="43.20251121"

config/fontconfig/conf.d 
❯ 

