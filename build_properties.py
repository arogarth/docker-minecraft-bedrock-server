import os
import re

# Dictionary to save properties key-value-pairs
properties={}

file="%s/server.properties" % os.environ["WORKDIR"]
with open(file) as fp:
    # iterate over file lines
    for _, line in enumerate(fp):
        line = line.strip()
        # ignore empty line and comments
        if re.match(r'^$|^#', line):
            continue
        # split line by '=' only once; first part is key, second is value
        parts = line.split("=",1)
        properties[parts[0]] = parts[1]
    fp.close()

# collect environmment variables starts with MC_
env_properties = [x for x in os.environ.keys() if x.startswith("MC_")]
for env in env_properties:
    value = os.environ[env]
    # normalize ENV Name
    env = env.lstrip("MC_")
    env = env.replace("_", "-")
    env = env.lower()
    # override ENV
    properties[env] = value

# write down to file
with open(file, "w+") as fp:
    for x in properties.keys():
        fp.write("%s=%s\n" % (x, properties[x]))
    fp.close()

