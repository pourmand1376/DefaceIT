#!/bin/bash

if [ -f "venv/bin/activate" ]; then
    source venv/bin/activate
    python defaceit_gui.py
elif [ -f "/usr/bin/python3" ]; then
    /usr/bin/python3 "$(dirname "$0")/defaceit_gui.py"
elif [ -f "/usr/local/bin/python3" ]; then
    /usr/local/bin/python3 "$(dirname "$0")/defaceit_gui.py"
else
    python3 "$(dirname "$0")/defaceit_gui.py"
fi

