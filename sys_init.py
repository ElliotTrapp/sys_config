import logging, argparse, os
from sys import platform
from init_linux import init_linux
from init_macos import init_macos
from init_windows import init_windows


if platform == "linux" or platform == "linux2": # linux
    init_linux()
elif platform == "darwin": # OS X
    init_macos()
elif platform == "win32": # Windows.
    init_windows()
else:
    logger.error('ERROR: Failed to determine what platform to initialize!')
