#!/usr/bin/env bash
previous_tag=0
for current_tag in $(git tag --sort=-creatordate)
do
    #echo Previous Tag = ${previous_tag}
    #echo Current Tag = ${current_tag}
    #echo First tag = ${first_tag}

    if [ "$previous_tag" != 0 ];then
        tag_date=$(git log -1 --pretty=format:'%ad' --date=short ${previous_tag})
        printf "## ${previous_tag} (${tag_date})\n\n"
        git log ${current_tag}...${previous_tag} --pretty=format:'*  %s [View](https://github.com/jsys/myproject/commits/%H)' --reverse | grep -v Merge
        printf "\n\n"
    fi
    previous_tag=${current_tag}
    #echo ------------
done
