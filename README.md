# Untitled Fedora Kinoite Container Image

This is a work-in-progress image that leverages [ostree native
containers](https://coreos.github.io/rpm-ostree/container/) to deploy a custom
variant of [Fedora Kinoite](https://fedoraproject.org/atomic-desktops/kinoite/)
with a handful of tweaks.

Based on [fedora/fedora-kinoite on Quay](https://quay.io/fedora/fedora-kinoite).
Differences from upstream are as follows:

* Automatic updates
  * `rpm-ostreed` is configured to stage updates for deployment
  * `rpm-ostreed-automatic.timer` is enabled, runs 1 hour after boot and once a
    day afterward
* Distrobox is used in place of Toolbox
* RPM Fusion repositories are installed by default
  * `ffmpeg-free` is removed and replaced by `ffmpeg` from RPM Fusion
  * Multimedia codecs are installed by default
* Virtualization packages installed by default
* Steam, gamescope, and MangoHUD installed by default
* Other extra utilities included
  * Zsh
  * Kitty terminal
  * Neovim

## See Also

* [Universal Blue](https://universal-blue.org/): More opinionated, more mature
  images based on Fedora Atomic
* [aguslr/bluevanilla](https://github.com/aguslr/bluevanilla): *Less*
  opinionated, more mature images based on Fedora Silverblue

