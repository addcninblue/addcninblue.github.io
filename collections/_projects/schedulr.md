---
layout: page
title: "Schedulr"
priority: 5
---

## Background
During my days consulting for [Valley Consulting Group]() at Berkeley, I joined the team responsible for recruiting students on campus. A friend and I were tasked with creating timeshifts for the club (around 12-hour shifts per person for two weeks combined). The task was tedious by hand to begin with, and on top of that, we were required to handle any time conflicts by communicating with others through Slack. I figured there was a better way, so I wrote a Flask bot that communicated over Slack to handle the scheduling.

## The Bot
The bot is written in Python-Flask, deployed on Heroku, and it uses Google Sheets as a "database" to allow for easy access and modification. In the end, my friend and I scheduled the time slots ourselves, as it didn't end up taking that long, and the bot handled all of the time conflicts that ended up saving hours of work.

The bot works as follows:
1. A member with a time conflict issues a request in the timeshifts channel.
2. The bot asks for a replacement in the channel with a clickable checkmark for a substitute to click.
3. Once a substitute clicks the checkmark, the substitute's name is filled into the time slot on the Google Sheet.

In addition to this, the bot also handled shift attendance by allowing shift managers to mark members as absent with as a simple message in the shift-managers slack channel.

## Conclusion
Overall the bot was extremely successful. One particular issue is a lack of incentive for others to take up slots, so some went unfilled as a consequence. It did, however, allow for easy swapping of shifts (as two people could just simultaneously issue requests). The bot has been in use for the past two semesters, and is scalable to many different team sizes and needs.

[Github](https://github.com/addcninblue/slack-timeshifts)
