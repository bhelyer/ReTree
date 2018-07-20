## What is ReTree?

I got fed up with what was available in terms of recursively
removing directories under plain CMD, so I wrote this simple little utility.

ReTree goes through every argument its given and recursively moves
files to the recycling bin. That's it. I don't really expect this
to be useful to anyone but myself, but if I'm going to throw it
on GitHub anyway, I may as well make it a little presentable.

64 bit only.

## Justification

`rmdir /s` is bizarre, trimming directories one at a time, requiring
multiple invocations until it clears a directory. `del /s /q` deletes files,
but doesn't remove folders, and is unforgiving of fat fingering.

## License

Copyright 2018 Bernard Helyer

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.