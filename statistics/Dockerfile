FROM debian:bookworm AS build

# You can set the GHC version via a docker command line argument: --build-arg GHC_VERSION=9.4.6
ARG GHC_VERSION=8.6.5
ENV GHC_VERSION=${GHC_VERSION} \
    PATH="/root/.ghcup/bin:$PATH"

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    build-essential curl libffi-dev libffi8 libgmp-dev libgmp10 libncurses-dev \
    libncurses6 pkg-config  ca-certificates binutils-gold libtinfo5 zlib1g-dev libsqlite3-dev

RUN curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh && \
    ghcup install ghc --set ${GHC_VERSION}

# Maybe improve with a svn checkout
WORKDIR /tmp
COPY get.sh  .
RUN sh -x get.sh
RUN mkdir /workdir
RUN cp -r ideas-statistics-1.0/src /workdir/src  
RUN cp  ideas-statistics-1.0/ideas-statistics.cabal ideas-statistics-1.0/*.txt /workdir/
WORKDIR /workdir
RUN ghcup install cabal 
RUN cabal install --installdir=/workdir/

FROM agerdes/ideas-cgi:latest

#COPY ./my-httpd.conf /usr/local/apache2/conf/httpd.conf
#COPY ./html/index.html /usr/local/apache2/htdocs/
#COPY ./html/tutor.css /usr/local/apache2/htdocs/
#COPY ./html/media /usr/local/apache2/htdocs/media
COPY --from=build "/workdir/statistics.cgi" /usr/lib/cgi-bin/
