from __future__ import print_function, unicode_literals

from PyInquirer import style_from_dict, Token, prompt, Separator
from todo_lib import re_grep, print_matches
from pprint import pprint
import os, re, datetime, argparse

horizontalline = '-------------------------------------------------------------------------------------------------'

def get_done(path):
    matches = re_grep('#TODO\[X\]', path)
    return matches

def list_done(project=None):
    if project is None:
        notes_path = os.getenv('notes')
    else:
        notes_path = str(os.path.join(os.getenv(project), 'notes/'))
    print(horizontalline)
    matches = get_done(notes_path)
    print_matches(matches)

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='list completed tasks')
    parser.add_argument('--project', required=False)
    args = parser.parse_args()
    list_done(project=args.project)

