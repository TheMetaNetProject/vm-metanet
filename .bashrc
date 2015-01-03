# $Header: /u/proto/proto/RCS/.bashrc,v 1.1 2011/08/10 23:40:42 yelmalio Exp yelmalio $
#
# The prototype .bashrc for ICSI
# Users should modify this to set things up to work how they require
#
###############################################################

###############################################################
## Various location-dependent variables

# Set the host variable
export HOST=$(hostname | cut -f1 -d.)

# Set up the XPRINT server
if [ ! -n "$XPSERVERLIST" ] && [ -x /etc/init.d/xprint ] ; then
  export XPSERVERLIST=$(/etc/init.d/xprint get_xpserverlist)
fi

###############################################################
## Some configuration commands
# This means that, by default, files are created so other folks can read them
umask 022

# Don't change this unless you understand what it does
ulimit -c 0

###############################################################
## Setting up a basic path and MANPATH

# Never put . in your path. You can run things in the current directory
# by prefixing the name with a ./ for example: ./a.out

export PATH=/usr/local/bin:/usr/bin:/bin:/home/metanet/bin
export MANPATH=/usr/local/man:/usr/man

# On Solaris, some useful commands are in /usr/ucb
if [ -d /usr/ucb ] ; then 
  PATH=/usr/ucb:$PATH
fi

# Also, make et. al. are in /usr/ccs/bin
if [ -d /usr/ccs/bin ] ; then
  PATH=/usr/ccs/bin:$PATH
fi

# Some users have their own command directory and man pages
if [ -d $HOME/bin ] ; then
  PATH=$HOME/bin:$PATH
fi
if [ -d $HOME/man ] ; then
  export MANPATH=$HOME/man:$MANPATH
fi

# Next we add X stuff
# Use stuff in /usr/local/ first, then native stuff, then old X11 local stuff
if [ -d /usr/openwin ] ; then
  # The Sun X setup
  PATH=$PATH:/usr/openwin/bin:/usr/local/X11/bin
  export MANPATH=$MANPATH:/usr/openwin/man:/usr/local/X11/man
  export OPENWINHOME=/usr/openwin
else 
  if [ -d /usr/X11 ] ; then
    # Other, e.g. Linux, X setup
    PATH=$PATH:/usr/X11/bin
    export MANPATH=$MANPATH:/usr/x11/man
  fi
fi

###############################################################
## Below are application-specific additions to the environment.
## These can be commented in or out as required

# Sun C/C++ development tools
if [ -d /usr/local/opt/SUNWspro ] ; then
  PATH=/usr/local/opt/SUNWspro/bin:$PATH
  export MANPATH=/usr/local/opt/SUNWspro/man:$MANPATH
fi


# FrameMaker
if [ -d /usr/local/text/frame ] ; then
  export FMHOME=/usr/local/text/frame
  export PATH=$FMHOME/bin:$PATH
fi

# Netscape
if [ -d /usr/local/netscape/communicator/default ] ; then
  export MOZILLA_HOME=/usr/local/netscape/communicator/default
fi

###############################################################
## The following stuff is only used in interactive shells

if [ ! -z "$PS1" ] ; then
  HISTSIZE=100
  SAVEHIST=50
  set -o noclobber
  set -o ignoreeof
  MAIL=/var/spool/mail/$USER
  ## TCSH VERSION: set mail =   (1 /var/spool/mail/$USER)
  if [ -n "${BASH+x}" ] ; then
    PS1="[\u@\h:~]$ "
  else
    PS1="[\u@\h]! "
    ## set prompt = $USER@$HOST"[\!] "
  fi
fi

## Metanet

if [ -f /u/metanet/etc/metanet.bashrc ] ; then 
  source /u/metanet/etc/metanet.bashrc
fi
