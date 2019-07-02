#!/usr/bin/env bash
echo "Update system" \
&& sudo yum -y update \
&& echo "Add epel system" \
&& sudo yum -y install epel-release
