#!/bin/sh
case "$1" in
	"+")
		amixer -D pulse set Master 1%+ && paplay /usr/share/sounds/freedesktop/stereo/audio-volume-change.oga &;;
	"-")
		amixer -D pulse set Master 1%- && paplay /usr/share/sounds/freedesktop/stereo/audio-volume-change.oga &;;
	"m")
		amixer -D pulse set Master toggle ;;
esac
