#!/usr/bin/env python3

import sys
import os
import platform
import subprocess
from pathlib import Path

def check_python():
    if sys.version_info < (3, 8):
        print("ERROR: Python 3.8 or higher is required")
        print(f"Current version: {sys.version}")
        sys.exit(1)

def check_tkinter():
    try:
        import tkinter
        return True
    except ImportError:
        return False

def find_venv_python():
    app_dir = Path(__file__).parent
    system = platform.system()
    
    if system == "Windows":
        venv_python = app_dir / "venv" / "Scripts" / "python.exe"
    else:
        venv_python = app_dir / "venv" / "bin" / "python3"
    
    if venv_python.exists():
        return str(venv_python)
    return None

def run_app():
    app_dir = Path(__file__).parent
    os.chdir(app_dir)
    
    system = platform.system()
    venv_python = find_venv_python()
    
    if venv_python:
        print("Using virtual environment...")
        python_cmd = venv_python
    else:
        print("Using system Python...")
        python_cmd = sys.executable
    
    if not check_tkinter():
        print("\nWARNING: Tkinter not found!")
        print("Attempting to use system Python which usually has tkinter...")
        
        if system == "Darwin":
            system_python = "/usr/bin/python3"
            if os.path.exists(system_python):
                python_cmd = system_python
                print(f"Using: {python_cmd}")
            else:
                print("\nERROR: Tkinter is required but not found.")
                print("Please install it:")
                print("  macOS: brew install python-tk")
                print("  Linux: sudo apt-get install python3-tk")
                sys.exit(1)
        elif system == "Linux":
            print("\nERROR: Tkinter is required but not found.")
            print("Please install it:")
            print("  sudo apt-get install python3-tk  # Ubuntu/Debian")
            print("  sudo yum install python3-tk      # RHEL/CentOS")
            sys.exit(1)
        else:
            print("\nERROR: Tkinter is required but not found.")
            print("Please reinstall Python with tkinter support.")
            sys.exit(1)
    
    gui_file = app_dir / "defaceit_gui.py"
    
    if not gui_file.exists():
        print(f"ERROR: {gui_file} not found!")
        sys.exit(1)
    
    print(f"\nStarting DefaceIT...")
    print(f"Python: {python_cmd}")
    print(f"GUI: {gui_file}\n")
    
    try:
        if system == "Windows":
            subprocess.run([python_cmd, str(gui_file)], check=True)
        else:
            os.execv(python_cmd, [python_cmd, str(gui_file)])
    except KeyboardInterrupt:
        print("\n\nApplication closed by user.")
    except subprocess.CalledProcessError as e:
        print(f"\nERROR: Failed to start application: {e}")
        sys.exit(1)
    except Exception as e:
        print(f"\nERROR: {e}")
        sys.exit(1)

if __name__ == "__main__":
    check_python()
    run_app()

