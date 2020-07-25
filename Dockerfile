FROM ubuntu:20.04

# https://leanprover-community.github.io/install/debian_details.html

RUN apt-get update && apt-get -y install \
    curl git python3 python3-pip python3-venv

# https://stackoverflow.com/a/53605439/5044950
RUN curl https://raw.githubusercontent.com/Kha/elan/v0.10.2/elan-init.sh -sSf \
    | bash -s -- -y
ENV PATH "/root/.elan/bin:$PATH"

ENV PATH "$PATH:/root/.local/bin"
RUN python3 -m pip install --user pipx
RUN pipx install mathlibtools
