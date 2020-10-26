import os, re

horizontalline = '-------------------------------------------------------------------------------------------------'

def re_grep(raw_pattern, directory):
    pattern = re.compile(raw_pattern)
    matches = []
    for path, _, files in os.walk(directory):
        for fn in files:
            filepath = os.path.join(path, fn)
            with open(filepath) as handle:
                try:
                    for lineno, line in enumerate(handle):
                        mo = pattern.search(line)
                        if mo:
                            matches.append({'filepath': filepath, 'lineno': lineno, 'task': line.strip()})
                except UnicodeDecodeError as e:
                    pass
    return matches

def print_matches(matches):
    for match in matches:
        print('{}:{} {}'.format(match.get('filepath'), match.get('lineno'), match.get('task')))

