## What is ReTree?

I got fed up with what was available in terms of recursively
removing directories under plain CMD, so I wrote this simple little utility.

ReTree goes through every argument it's given and recursively moves
files to the recycling bin. That's it. I don't really expect this
to be useful to anyone but myself, but if I'm going to throw it
on GitHub anyway, I may as well make it a little presentable.

[Download! (64 bit only)](https://github.com/bhelyer/ReTree/releases/tag/v1.0.0).

## Justification

`rmdir /s` is bizarre, trimming directories one at a time, requiring
multiple invocations until it clears a directory. `del /s /q` deletes files,
but doesn't remove folders, and is unforgiving of fat fingering.
