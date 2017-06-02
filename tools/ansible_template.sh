#!/bin/sh
#
#   Create a hierarchy for Ansible playbooks
#
#   -- Does no error checking
#   -- Isn't pretty
#   -- Works
#   -- Creates a .gitkeep file to preserve empty folder when using git
#
#   No warranties.

PATH=/bin:/usr/bin

TOPLEVEL="group_vars host_vars library filter_plugins roles roles/common roles/Template"
ROLEDIR="tasks handlers templates files vars defaults meta"

for dir in ${TOPLEVEL}
do
    echo "Creating ${dir}"
    mkdir -p ${dir}
    echo 'Retain blank folder' >> "${dir}/.gitkeep"
done

for base in roles/common roles/template
do
    for dir in ${ROLEDIR}
    do
        echo "Creating ${base}/${dir}"
        mkdir -p "${base}/${dir}"
        echo 'Retain blank folder' >> "${base}/${dir}/.gitkeep"
    done
done
