#! /bin/sh
#
# Early version of a downloader/installer for Istio
#
# This file will be fetched as: curl -L https://git.io/getIstio | sh -
# so it should be pure bourne shell, not bash (and not reference other scripts)
#
# The script fetches the latest STABLE Istio release and untars it.
#
# release/downloadIstioCandidate.sh lets users override the ISTIO_VERSION
# and is updated more often.

# DO NOT UPDATE THIS VERSION OR SCRIPT LIGHTLY - THIS IS THE "STABLE" VERSION
ISTIO_VERSION="0.8.0"

NAME="istio-$ISTIO_VERSION"
OS="$(uname)"
if [ "x${OS}" = "xDarwin" ] ; then
  OSEXT="osx"
else
  # TODO we should check more/complain if not likely to work, etc...
  OSEXT="linux"
fi
URL="https://github.com/istio/istio/releases/download/${ISTIO_VERSION}/istio-${ISTIO_VERSION}-${OSEXT}.tar.gz"
echo "Downloading $NAME from $URL ..."
curl -L "$URL" | tar xz
echo "Downloaded into $NAME:"
BINDIR="$(cd $NAME/bin; pwd)"

cp -f $BINDIR/* /usr/local/bin/
