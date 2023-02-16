#!/bin/bash

MAX_DAYS=360

# Remove these lines
# rm -rf .git
# git init

cat <<EOF >> README.md
# Git Commit Generator
This script generates git commits for past dates.
EOF

# git add .
# git commit --date "$date" -m "$message"

days=$(seq $MAX_DAYS | tail -r)

for day in $days ; do
	date="$day days ago"
	message="Update in README.md" # Changed the message here
	echo "- Update for $date" >> README.md
	git add .
	git commit --date "$date" -m "$message"
done

git log --oneline | tail -r

cat <<EOF
To push these commits to a remote repository, run:

		git remote add origin https://github.com/rubendiazzz/rubendiazzz.git
		git push -u origin master

EOF