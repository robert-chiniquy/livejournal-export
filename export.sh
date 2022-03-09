#! /usr/bin/env bash

set -e

NAME="$1"
YEAR="$2"
MONTH="$3"

COOKIE=$(cat <<EOF
`cat COOKIE`
EOF
)

DATA="what=journal&year=$YEAR&month=$MONTH&format=xml&header=on&encid=2&field_itemid=on&field_eventtime=on&field_logtime=on&field_subject=on&field_event=on&field_security=on&field_allowmask=on&field_currents=on"

FILENAME="$NAME-$YEAR-$MONTH.xml"

curl --request POST -q --cookie "$COOKIE" "https://www.livejournal.com/export_do.bml?authas=$NAME" --data "$DATA" -o "$FILENAME"