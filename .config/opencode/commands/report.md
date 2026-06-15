---
description: Generate a concise one line report of what changes we've just made
agent: build
---

Generate a simple one sentence report based on the changes of this session. Adhere to this conventions:
Filename: Today_Report.md
Rule: Check the time, if it's morning put the sentences in the morning and keep Afternoon empty. Only when it's Afternoon you'll put the generated sentence below the afternoon. Also if you see a list of sentence already there do not overwrite them, simply add a new line and put the generated sentence below.

Content {
Today technical reports of {modify this block to current date}:
+ Morning
- {The generated activity sentence}
+ Afternoon
- {The generated activity sentence}
}
