#!/bin/bash

echo "=========================================="
echo "  DefaceIT - Setup Script"
echo "  For macOS and Linux"
echo "=========================================="
echo ""

if ! command -v python3 &> /dev/null; then
    echo "ERROR: Python 3 is not installed"
    echo "Please install Python 3.8 or higher first"
    echo "Visit: https://www.python.org/downloads/"
    exit 1
fi

echo "✓ Python 3 found: $(python3 --version)"
echo ""

echo "Checking for tkinter..."
python3 -c "import tkinter" 2>/dev/null
if [ $? -ne 0 ]; then
    echo "⚠️  Tkinter not found. Installing..."
    if [[ "$OSTYPE" == "darwin"* ]]; then
        if command -v brew &> /dev/null; then
            echo "Installing python-tk via Homebrew..."
            brew install python-tk
        else
            echo "⚠️  Homebrew not found."
            echo "Please install tkinter manually:"
            echo "   brew install python-tk"
            echo "Or use system Python: /usr/bin/python3 defaceit_gui.py"
        fi
    elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
        echo "Please install python3-tk:"
        echo "  sudo apt-get install python3-tk  # Ubuntu/Debian"
        echo "  sudo yum install python3-tk      # RHEL/CentOS"
    fi
else
    echo "✓ Tkinter is available"
fi
echo ""

echo "Creating virtual environment..."
if [ ! -d "venv" ]; then
    python3 -m venv venv
    echo "✓ Virtual environment created"
else
    echo "✓ Virtual environment already exists"
fi
echo ""

echo "Activating virtual environment..."
source venv/bin/activate
echo "✓ Virtual environment activated"
echo ""

echo "Upgrading pip..."
pip install --upgrade pip --quiet
echo "✓ pip upgraded"
echo ""

echo "Installing dependencies..."
echo "This may take a few minutes..."
pip install -r requirements.txt
echo ""

if [ $? -eq 0 ]; then
    echo "=========================================="
    echo "  Setup Complete!"
    echo "=========================================="
    echo ""
    echo "Starting DefaceIT..."
    echo ""
    python3 run.py
else
    echo "ERROR: Installation failed"
    echo "Please check the error messages above"
    exit 1
fi
