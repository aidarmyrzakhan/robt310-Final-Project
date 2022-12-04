from aermanager.aerparser import load_events_from_file
from aermanager.parsers import parse_aedat4

filename = "robt_data.aedat4"
shape, events = load_events_from_file(filename, parser=parse_aedat4)

ls = events.tolist()
ans = []
for e in ls:
    temp = list(e)
    temp[3] = int(temp[3])
    ans.append(temp)

name = 'output.txt'
with open(name, 'w') as file:
    ww = str(shape[1]) + " " + str(shape[0]) + '\n'
    file.write(ww)
    for line in ans:
        file.write(str(line[2]) + " " + str(line[0]) + " " + str(line[1]) + " " + str(line[3]) + "\n")

