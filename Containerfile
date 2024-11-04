ARG FEDORA_VERSION=41

FROM quay.io/fedora/fedora-kinoite:${FEDORA_VERSION}

RUN sed -i 's/#AutomaticUpdatePolicy.*/AutomaticUpdatePolicy=stage/' /etc/rpm-ostreed.conf && \
    systemctl enable rpm-ostreed-automatic.timer && \
    rpm-ostree override remove toolbox --install distrobox && \
    rpm-ostree install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
                       https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm && \
    rpm-ostree override remove ffmpeg-free libavdevice-free libavcodec-free libavfilter-free libavformat-free libavutil-free libpostproc-free libswresample-free libswscale-free \
                     --install ffmpeg \
                     --install gstreamer1-plugin-libav \
                     --install gstreamer1-plugins-bad-free-extras \
                     --install gstreamer1-plugins-bad-freeworld \
                     --install gstreamer1-plugins-ugly \
                     --install gstreamer1-vaapi && \
    rpm-ostree override remove mesa-va-drivers --install mesa-va-drivers-freeworld --install mesa-vdpau-drivers-freeworld && \
    rpm-ostree install intel-media-driver libva-intel-driver && \
    rpm-ostree install zsh kitty neovim && \
    rpm-ostree install virt-install qemu-kvm libvirt-daemon-config-network libvirt-daemon-kvm virt-manager && \
    rpm-ostree install steam gamescope mangohud && \
    rpm-ostree cleanup -m && ostree container commit
