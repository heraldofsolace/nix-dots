{writeShellApplication}:
writeShellApplication {
  name = "cellwriter-sh";
  text = ''
    #!/usr/bin/env bash
    # Original author: mr_deimos (ubuntuforums.org). February 14, 2010
    # Many bugs fixed and improvements made by Ben Wong.  October 20, 2010

    # This script toggles the cellwriter letter recognizer window.
    # If a cellwriter window is visible, it will be hidden.
    # If cellwriter is not already running, this will create a new process.
    # If coordinates are specified, the window pops up at those coordinates.
    # If coordinates are not specified, the window is toggled, but not moved.

    # Implementation Note: this script is trickier than it should be
    # because cellwriter does two stupid things. First, it has no
    # --get-state option, so we can't tell if it is hidden or not. Second,
    # both the notification area applet and the actual program window have
    # the same window name in X, which means we can't simply use xwininfo
    # to find out if it is showing or not.
    #
    # (Of course, we wouldn't have to be doing this crazy script at all,
    # if cellwriter had a --toggle-window option to toggle showing the
    # keyboard, but that's another rant...)
    #
    # To work around the problem, we'll assume that if the window we got
    # information about from xwininfo is smaller than 100 pixels wide, it
    # must be an icon in the notification area. This may be the wrong
    # assumption, but, oh well...

    if [[ "$1" == "-v" || "$1" == "--verbose" ]]; then
        verbose="echo"
        shift
    else
        verbose=:
    fi

    if [[ "$1" && -z "$2"  ||  "$1" == "-h"  ||  "$1" == "--help" ]]; then
        cat >&2 <<EOF
    $(basename "$0"): Toggle showing the cellwriter window, optionally moving it."

    Usage:  $(basename "$0") [x y]"
        Where x and y are the desired position of the cellwriter window."
        If x and y are omitted, the window is not moved."
    EOF
        exit 1
    fi

    if [[ "$1" && "$2" ]]; then
        x=$(($1-20))			# Offset slightly so cursor will be in window
        y=$(($2-30))
        [ "$x" -lt 0 ] && x=0		# Minimum value is zero
        [ "$y" -lt 0 ] && y=0
    fi

    if ! xwininfo -root >/dev/null; then
        echo "$(basename "$0"): Error: Could not connect to your X server." >&2
        exit 1
    fi

    # Try to obtain CellWriter's window id.
    # We can't use "xwininfo -name" b/c that might find the notification icon.
    OLDIFS="$IFS"
    IFS=$'\n'
    for line in $(xwininfo -root -tree | grep CellWriter); do
        line=0x''${line#*0x}		# Just to get rid of white space before 0x.
        $verbose -en "Checking: $line\t"
        if [[ $line =~ (0x[A-Fa-f0-9]+).*\)\ *([0-9]+)x([0-9]+) ]]; then
        id=''${BASH_REMATCH[1]}
        width=''${BASH_REMATCH[2]}
        export height=''${BASH_REMATCH[3]}
        if [[ $width -gt 100 ]]; then
            $verbose "looks good."
            CW_WIN_ID=$id
            break;
        else
            $verbose "too small, ignoring."
        fi
        else
        echo "BUG: The xwininfo regular expression in $0 is broken." >&2
        fi
    done
    IFS="$OLDIFS"

    #Check if Cellwriter's window is visible
    if [ "$CW_WIN_ID" ]; then
        CW_MAP_STATE=$(xwininfo -id "$CW_WIN_ID"|grep "Map State"|cut -f 2 -d:)
    else
        $verbose "Can't find cellwriter window, checking for a running process..."
        if ! pgrep -x cellwriter >& /dev/null; then
        $verbose "No cellwriter process running, starting a new one."
        if [[ "$x" && "$y" ]]; then
            cellwriter --show-window --window-x=$x --window-y=$y &
        else
            cellwriter --show-window &
        fi
        exit 0
        else
        $verbose "Found a process, so the window has not been created yet."
        $verbose "Pretending the window is UnMapped."
        CW_MAP_STATE=IsUnMapped
        fi
    fi

    $verbose "Map state: $CW_MAP_STATE"

    case "$CW_MAP_STATE" in

        *IsViewable*)		# Window is currently visible.
        $verbose "hiding window"
        cellwriter --hide-window &
        ;;

        *IsUnMapped*)		# Window is currently hidden or non-existent.
        if [[ "$x" && "$y" && "$CW_WIN_ID" ]]; then
            $verbose "moving window to $x $y"
            xdotool windowmove "$CW_WIN_ID" $x $y
        fi
        $verbose "showing window"
        cellwriter --show-window &    # In bg in case cw is not already running
        ;;

        *) 				# This will never happen...
        echo "BUG: cellwriter is neither viewable nor unmapped" >&2
        echo "BUG: ...which means this script, $0, is buggy." >&2
        exit 1
        ;;
    esac

    exit 0
  '';
}
