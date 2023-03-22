import re
import fileinput

def make_conversions(line):
    # FF, CR, LF
    line = re.sub(r'[\x0C\n\x0A]', '', line)
    line = re.sub(r'^(#+) ', r'\g<1>1. ', line)

    if re.search(' .Otsikko-3.1', line):
        line = re.sub(r' \.Otsikko-3\.1', '', line)
        line = re.sub(r'^#+', '', line)
        line = f"###{line}"

    if re.search(' .Otsikko-4.1', line):
        line = re.sub(r' \.Otsikko-4\.1', '', line)
        line = re.sub(r'^#+', '', line)
        line = f"####{line}"

    if re.search(' .Otsikko-5.1', line):
        line = re.sub(r' \.Otsikko-5\.1', '', line)
        line = re.sub(r'^#+', '', line)
        line = f"#####{line}"

    return line

for line in fileinput.input():
    line.rstrip()
    line = make_conversions(line)
    print(line)