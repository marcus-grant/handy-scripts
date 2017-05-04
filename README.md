# handy-scripts

A set of handy scripts I use on a lot of my UNIX based systems

## Sciptser

### link-scripts.sh
This script should be the first script called after cloning this repository on a new system, or whenever a new script is added. It looks for all files ending in a file extension associated with scripts, checks those against all files in `/usr/local/bin` and deletes files/links if they're already there, then finally links all scipt files in the repo directory there.

### lvm-cache-stats.sh
A one line script that uses the `lvs` command from `lvm` that lists stats for logical volumes including cache information

# TO-DO
- [x] link-scripts.sh
- [ ] add more script extensions to link-scripts.sh
- [ ] give link-scripts.sh ability to detect OS to link to correct directory if not Linux
