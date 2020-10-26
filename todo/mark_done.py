from __future__ import print_function, unicode_literals

from PyInquirer import style_from_dict, Token, prompt, Separator
from todo import get_todos
from pprint import pprint
import os, re, datetime, argparse, sys

horizontalline = '-------------------------------------------------------------------------------------------------'

def mark_done(project=None, done=None):
    style = style_from_dict({
        Token.Separator: '#cc5454',
        Token.QuestionMark: '#673ab7 bold',
        Token.Selected: '#cc5454',  # default
        Token.Pointer: '#673ab7 bold',
        Token.Instruction: '',  # default
        Token.Answer: '#f44336 bold',
        Token.Question: '',
    })

    if project is None:
        notes_path = os.getenv('notes')
    else:
        notes_path = os.path.join(os.getenv(project), 'notes/')

    if done is None:
        matches = get_todos(notes_path)
        choices = [Separator('= TODO =')]
        for match in matches:
            choices.append({'name': match.get('task')})
        questions = [
            {
                'type': 'checkbox',
                'message': 'Select complete task',
                'name': 'tasks',
                'choices': choices,
                'validate': lambda answer: 'You must complete at least 1 task' \
                    if len(answer) == 0 else True
            }
        ]

        answers = prompt(questions, style=style)
        if not answers:
            sys.exit(0)
        for answer in answers['tasks']:
            for match in matches:
                if answer == match['task']:
                    updated_task = match['task'].replace('#TODO[ ]:', '#TODO[X]:')
                    with open(match['filepath'], 'r') as handle:
                        lines = handle.readlines()
                    with open(match['filepath'], 'w') as handle:
                        for line in lines:
                            if match['task'] in line:
                                handle.write(updated_task + '\n')
                            else:
                                handle.write(line)
                        print('Updated {}'.format(match['filepath']))
                    
if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='manage todo lists')
    parser.add_argument('--project', required=False)
    args = parser.parse_args()
    mark_done(project=args.project)

