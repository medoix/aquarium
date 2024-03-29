FROM ubuntu:latest

# Install tools and libs
RUN apt-get update && \
    apt-get install -y libcurses-perl perl wget make tar

# Install term::animation
WORKDIR /tmp
RUN wget http://search.cpan.org/CPAN/authors/id/K/KB/KBAUCOM/Term-Animation-2.6.tar.gz && \
    tar -zxvf Term-Animation-2.6.tar.gz
WORKDIR /tmp/Term-Animation-2.6/
RUN perl Makefile.PL && make && make test && \
    make install

# install asciiquarium
WORKDIR /tmp
RUN wget http://www.robobunny.com/projects/asciiquarium/asciiquarium.tar.gz && \
    tar -zxvf asciiquarium.tar.gz
WORKDIR /tmp/asciiquarium_1.1/

RUN cp asciiquarium /usr/local/bin && \
    sed "s/=| | | |/=|sakib|/g" /usr/local/bin/asciiquarium >> /opt/asciiquarium
RUN cp /opt/asciiquarium /usr/local/bin/asciiquarium && \
    chmod 0755 /usr/local/bin/asciiquarium

#CMD ["/bin/bash"]
CMD ["/usr/local/bin/asciiquarium"]
