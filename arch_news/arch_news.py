#!/usr/bin/python
# @depends python-feedparser

#################################################################
# Small Python utility to run periodically in Polybar           #
# Reads the Arch news feed and prints if a new entry was added  #
# in the past given days                                        #
# give the number of days as the cli-argument                   #
# the default is 10                                             #
#################################################################

import feedparser
from subprocess import call
import re
import textwrap
import datetime
import sys

# get number of days to look in the past until, 10 is the default
lookback = 10
if len(sys.argv) == 2:
    lookback = int(sys.argv[1])

# get feed
feed = feedparser.parse("https://www.archlinux.org/feeds/news/")

# get latest entry
entry = feed.entries[0]

# get abreviated title
title = entry.title[:25] + "..."

# get date
dateText = entry.published[:-6]

# extract datetime
date = datetime.datetime.strptime(dateText, "%a, %d %b %Y %H:%M:%S")

# if the published date is less than 10 days ago, print the title
if date > datetime.datetime.now() - datetime.timedelta(days=lookback):
    print(title)
