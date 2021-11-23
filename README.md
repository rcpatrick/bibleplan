# bibleplan
Follow a Bible-reading plan with [kjv\(1\)](https://github.com/bontibon/kjv)

## Synopsis
	bibleplan [date] [-l, --list date] [-f, --file] [-e --edit] [-m --make year] [-h, --help]

## Description
`bibleplan` allows you to follow a Bible-reading plan with [kjv\(1\)](https://github.com/bontibon/kjv), right in your terminal.

The reading plan is a plain text file, located by default at `/usr/local/share/bibleplan/plan.txt`. Each day of reading is represented by a line beginning with a date in DDMMM format, followed by a semicolon-delimited set of passages, like so:

```
22NOV; Ezra 1-2; John 21
```
`bibleplan` parses this file, finds the line containing the current date's reading (if any), extracts the relevant passages, and sends them one at a time to [kjv(1)](https://github.com/bontibon/kjv).

## Usage
`bibleplan` has two main functionalities:

1. Following a plan
2. Creating plan files

### Following a Plan
Assuming there's a plan file at `/usr/local/share/bibleplan/plan.tx` (there is by default), you can open today's reading with the following command:

```
bibleplan
```

To open another day's reading:

```
bibleplan [date]
```

Dates must be written in DDMMM format, but paddinz with zeros is not required. For example: 01JAN, 01jan, 1JAN, 1jan are all valid dates.

### Creating a Plan
Make a new reading plan based on the 5 day/week plan located at `/usr/local/share/bibleplan/5daytemplate.txt`. The following command will make a new plan for the year 2022 and emit it to stdout:

```
bibleplan --make 2022
```

You can redirect the output of the --make command to `/usr/local/share/bibleplan/plan.txt` or to any other file you wish.



