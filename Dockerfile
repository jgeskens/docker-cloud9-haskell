FROM kdelfour/cloud9-docker:latest

RUN apt-get update
RUN apt-get install -y ghc ghc-mod cabal-install wget

RUN wget -q -O- https://s3.amazonaws.com/download.fpcomplete.com/ubuntu/fpco.key | sudo apt-key add -
RUN echo 'deb http://download.fpcomplete.com/ubuntu/utopic stable main'|sudo tee /etc/apt/sources.list.d/fpco.list
RUN sudo apt-get update && sudo apt-get install stack -y
RUN cabal update
RUN stack update

RUN rm -rf /var/lib/apt/lists/*
