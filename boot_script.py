
import random
import os

folder_names = [name for name in os.listdir("/home/pi/Pi-Programs") if os.path.isdir(name)]

program_paths = []

for name in folder_names:
    if name[0] != ".":
        program_paths.append(name)

print(program_paths)

random_int = random.randint(0, len(program_paths)-1)

command = "processing-java --sketch=" + program_paths[random_int] +\
          " --run " + program_paths[random_int]+"/"+program_paths[random_int]+".pde"
print("command is : ", command)
# call the program using processing
os.system(command)
