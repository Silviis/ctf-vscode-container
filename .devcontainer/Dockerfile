FROM kalilinux/kali-rolling
ENV USERNAME=kali
ARG ZSH_THEME=htb
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update
RUN apt install kali-linux-everything -y
RUN apt install iputils-ping sudo python3-pip dialog nano git zsh curl -y

# Additional tools
RUN apt install kali-tools-crypto-stego python3-zbar -y

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

# oh-my-zsh
USER $USERNAME
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
RUN sed -i "s!robbyrussell!${ZSH_THEME}!g" /home/$USERNAME/.zshrc  # Replace default theme
RUN sudo chsh -s /bin/zsh $USERNAME
RUN echo 'if [ -f /workspaces/ctf-vscode-container/scripts/target.sh ]; then source /workspaces/ctf-vscode-container/scripts/target.sh; fi' >> ~/.zshrc
