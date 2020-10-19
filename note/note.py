import os, argparse, tempfile
from subprocess import call
from datetime import datetime

now = datetime.now()
year = now.strftime('%Y')
month = now.strftime('%m')
day = now.strftime('%d')

def create_note(note_path, note_dir):
    'Create note dir if it doesn''t exist'
    if not os.path.exists(note_dir):
        os.makedirs(note_dir)
    if not os.path.exists(note_path):
        with open(note_path, 'w+') as handle:
            handle.write('{}-{}-{}\n---\n'.format(day, month, year))
        print('Created new note: {}'.format(note_path))
    else:
        print('Note {} already exists. Saving changes to existing file'.format(note_path))

def open_note(note_path):
    'Open note with vim in insert mode'
    EDITOR = os.environ.get('EDITOR', 'vim')
    call([EDITOR, note_path])

def main(project=None, note=None):

    if project is None:
        note_dir = os.path.join(os.getenv('notes'), year, month)
    else:
        note_dir = str(os.path.join(os.getenv(project), 'notes/', year, month))
    note_path = os.path.join(note_dir, '{}.md'.format(day))

    create_note(note_path=note_path, note_dir=note_dir)
    if note:
        with open(note_path, 'a') as handle:
            handle.write(note)
    else:
        open_note(note_path=note_path)

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('--project', required=False)
    parser.add_argument('note', nargs=argparse.REMAINDER, default=None)
    args = parser.parse_args()
    note = ' '.join(args.note)
    main(project=args.project, note=note)
