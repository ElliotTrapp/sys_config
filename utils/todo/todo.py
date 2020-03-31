from __future__ import print_function, unicode_literals

from PyInquirer import style_from_dict, Token, prompt, Separator
from todo_lib import re_grep, print_matches
from pprint import pprint
import os, re, datetime, argparse

horizontalline = '-------------------------------------------------------------------------------------------------'

def get_todos(path):
    matches = re_grep('#TODO\[ \]', path)
    return matches

def todo(project=None, todo=None):
    if project is None:
        notes_path = os.getenv('notes')
    else:
        notes_path = str(os.path.join(os.getenv(project), 'notes/'))
    if todo is None:
        print(horizontalline)
        matches = get_todos(notes_path)
        print_matches(matches)
    else:
        now = datetime.datetime.now()
        year = now.strftime('%Y')
        month = now.strftime('%m')
        day = now.strftime('%d')
        note_dir=os.path.join(notes_path, year, month)
        note_path='{}.md'.format(os.path.join(note_dir, day))
        print(horizontalline)
        if not os.path.isfile(note_path):
            os.makedirs(note_dir)
            open(note_path, 'a').close()
            print('{}-{}-{}\n---\n\n > {}'.format(year, month, day, note_path))
            print('Created new note: {}\n'.format(note_path))
        else:
            print('Note {} already exists. Saving changes to existing file.\n'.format(note_path))
        with open(note_path, 'a') as note:
            note.write('#TODO[ ]: {}'.format(todo))

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='manage todo lists')
    parser.add_argument('--project', required=False)
    parser.add_argument('todo', nargs='?', default=None)
    args = parser.parse_args()
    #todo(project=args.project, todo=str(sys.argv[1:]))#todo=args.todo)
    todo(project=args.project, todo=args.todo)#todo=args.todo)
