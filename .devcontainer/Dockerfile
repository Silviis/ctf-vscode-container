FROM kalilinux/kali-rolling
ENV USERNAME=kali
ENV DEBIAN_FRONTEND=noninteractive
# Replace kali-linux-large with the specific metapackage you want to install. 
RUN apt update && apt install kali-linux-large -y
RUN apt install iputils-ping sudo python3-pip dialog nano -y

# Additional tools
RUN apt install steghide hexedit -y

# Add new user as a sudoer.
RUN useradd -m $USERNAME && \
        echo "$USERNAME:$USERNAME" | chpasswd && \
        usermod --shell /bin/bash $USERNAME && \
        usermod -aG sudo $USERNAME && \
        echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/$USERNAME && \
        chmod 0440 /etc/sudoers.d/$USERNAME && \
        # Replace 1000 with your user/group id
        usermod  --uid 1000 $USERNAME && \
        groupmod --gid 1000 $USERNAME
