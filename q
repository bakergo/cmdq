#!/bin/bash
FIFO="$HOME/.cache/cmdq/cmdq.sock"
LOCK="$HOME/.cache/cmdq/cmdq.lock"

mkdir -p $(dirname "$FIFO")
if [! -p "$FIFO" ] ; then
  echo "Creating pipe at $FIFO"
  if [ -e "$FIFO" ] ; then
    echo "removing old $FIFO"
    rm "$FIFO"
  fi
  mkfifo "$FIFO"
fi

flock "$LOCK" echo -en "cd $PWD ; $@\x0" >> $FIFO &

