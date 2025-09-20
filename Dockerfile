FROM ubuntu

# Define build arguments that can be overridden
ARG NVM_VERSION=0.40.3
ARG NODE_VERSION=22

# Copy all scripts to /usr/local/bin/scripts/
COPY scripts/ /usr/local/bin/

# Make all scripts executable, run the Neovim/NVM/Node installation script, 
# and remove it afterward if you don't want it lingering
RUN chmod -R +x /usr/local/bin/ && \
    /usr/local/bin/install_nvim.sh $NVM_VERSION $NODE_VERSION && \
    rm -f /usr/local/bin/install_nvim.sh

# Do not use ~ to reference home in Dockerfile, it doesn't work
COPY init.lua /root/.config/nvim/
COPY lua/ /root/.config/nvim/lua/

