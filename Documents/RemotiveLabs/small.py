from pathlib import Path

DIR = "C:/Users/Oscar Gren/Downloads/vehicle_signal_specification-master/spec"
f = open("vspecoutput.txt", "a")
pathlist = Path(DIR).glob('**/*.vspec')
for path in pathlist:
    # because path is object not string
    path_in_str = str(path)   
    name = path_in_str.split("vehicle_signal_specification-master")[1]
    s1 = "Start of: " + name + "\n"
    f.write(s1)
    with open(path_in_str) as spec:
        lines = spec.readlines()
        for l in lines:
            f.write(l)
    s2 = "End of: " + name + "\n"
    f.write(s2)

f.close