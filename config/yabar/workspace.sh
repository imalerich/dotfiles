#! /bin/bash 

WS=$(bspc query -D -d)


case "$WS" in
    "0x00A00006")
	WORKSPACE="● ○ ○ ○ ○   ○ ○ ○ ○ ○";;
    "0x00A00008")
	WORKSPACE="○ ● ○ ○ ○   ○ ○ ○ ○ ○";;
    "0x00A00009")
	WORKSPACE="○ ○ ● ○ ○   ○ ○ ○ ○ ○";;
    "0x00A0000A")
	WORKSPACE="○ ○ ○ ● ○   ○ ○ ○ ○ ○";;
    "0x00A0000B")
	WORKSPACE="○ ○ ○ ○ ●   ○ ○ ○ ○ ○";;
    "0x00A00007")
	WORKSPACE="○ ○ ○ ○ ○   ● ○ ○ ○ ○";;
    "0x00A0000C")
	WORKSPACE="○ ○ ○ ○ ○   ○ ● ○ ○ ○";;
    "0x00A0000D")
	WORKSPACE="○ ○ ○ ○ ○   ○ ○ ● ○ ○";;
    "0x00A0000E")
	WORKSPACE="○ ○ ○ ○ ○   ○ ○ ○ ● ○";;
    "0x00A0000F")
	WORKSPACE="○ ○ ○ ○ ○   ○ ○ ○ ○ ●";;
esac

printf " %s" "$WORKSPACE"
