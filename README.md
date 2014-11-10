SRT-processing
==============

Ruby exercise

Problem Description
-------------------
If you have seen any subtitled movie you obtained though internet for sure you know SubRip format. Its enries are like the following

645
01:31:51,210 --> 01:31:54,893
the government is implementing a new policy...

646
01:31:54,928 --> 01:31:57,664

In connection with a dramatic increase
in crime in certain neighbourhoods,
Each line has an increasing integer identification, then comes the time range (start and end time) in the format “hours:minutes:seconds,milliseconds”. The decimal separator used is the comma. Finally there are the subtitles themselves and a line break marks the end of an entry.

Time shifting
-------------
Sometimes the timing is shifted for a small amount, 2 or 3 seconds. Then comes the trouble when you need to shift everything a few seconds back or ahead.

You need to create a command line utility to help us to create a new subrip file that is shifted a random amount of milliseconds.

So, for example, if I want to shift everything 2500ms ahead, I would start with this:

01:32:04,283 --> 01:32:07,769
and end up with:

01:32:06,783 --> 01:32:10,269

Typos in file
-------------
Also there are many times that there are lots of typos in a SRT file. Make your program to create also a potential_typos.txt file that checks each of the words there and informs us of the ones that are not found in system's dictionary and when they happened. On Unix-based systems you can find that file in /usr/share/dict/words. The format of the output file should be something like:

Daenerys: 01:32:04,283 , 20:32:12,123 , 25:31:05,111
Winterfell: 03:15:01,123 , 03:18:23,145
...
Make sure you ignore punctuation signs.

Profanity filter
----------------
Now we need to add a profanity filter. For the first 30 minutes of the movie (you know that children go to bed afterwards) we need to add a profanity filter to the movie.

For each close caption you need to subtitute the words in a file called profanity_words.txt by CENSORED.

For example, in:

645
00:29:51,210 --> 00:29:54,893
the government is implementing fuck a new policy...

645
00:31:51,210 --> 00:31:54,893
Fuck, fuck and fuck a thousand times
the resulting srt should be

645
00:29:51,210 --> 00:29:54,893
the government is implementing CENSORED a new policy...

645
00:31:51,210 --> 00:31:54,893
Fuck, fuck and fuck a thousand times

Ignored words
-------------
Once you reach this point you will start to see that the program finds a lot of names. Maybe for a movie that is not a problem but when writing subs for a TV series having a list of words common to all of them is great. Add to you utility the possibility of having a custom list of words that are ignored for a given srt file. For example:

Khal
Drogo
Daenerys
Targaryen
