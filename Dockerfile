FROM ubuntu:20.04

# Create app directory
WORKDIR /usr/src/app

# Set environment variables to dummy to avoid audio/video errors
ENV LOVE_AUDIO=no
ENV SDL_VIDEODRIVER=dummy
ENV XDG_RUNTIME_DIR=/tmp


# Update, Upgrade, Install and Cleanup
RUN apt update \
    && apt -y upgrade \
    && apt install -y software-properties-common \
    && add-apt-repository ppa:bartbes/love-stable \
    && apt update \
    && apt install -y love \
    && apt install -y freeglut3-dev \
    && apt autoremove -y \
    && apt clean \
    && rm -rf /var/lib/apt/lists/*

COPY .asoundrc /root/.asoundrc

COPY Server ./

EXPOSE 27002

CMD [ "love", "." ]
