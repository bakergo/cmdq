#!/bin/bash

fifoopt=pipe
FIFO="$HOME/.cache/cmdq/cmdq.sock"
LOCK="$HOME/.cache/cmdq/cmdq.lock"

mkdir -p $(dirname "$FIFO")
if [ "$fifoopt" == "pipe" -a ! -p "$FIFO" ] ; then
  echo "Creating pipe at $FIFO"
  if [ -e "$FIFO" ] ; then
    echo "removing old $FIFO"
    rm "$FIFO"
  fi
  mkfifo "$FIFO"
elif [ "$fifoopt" == "sock" -a ! -S "$FIFO" ] ; then
  echo "Creating socket at $FIFO"
  if [ -e "$FIFO" ] ; then
    echo "removing old $FIFO"
    rm "$FIFO"
  fi
  netcat -lkU "$FIFO"
fi

flock "$LOCK" echo -en "cd $PWD ; $@\x0\x0" >> $FIFO &

