#!/usr/bin/env bash

if [ ! -f /tmp/ledpipe ]; then
    mkfifo /tmp/ledpipe
fi

echo <>/tmp/ledpipe &

sudo ./examples-api-use/text-example -y 2 --led-rows=16 --led-cols=32 --led-chain=1 --led-parallel=1 --led-multiplexing=10 -f ./fonts/5x7.bdf --led-inverse -b 1 < /tmp/ledpipe
