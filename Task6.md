## Task 6
One of our core values at Doximity is to leave the code better than you found it.

For this task, please take a look at the TweetMD project as a whole (as if you were performing a code review on the entire code base) and list out any changes you would make if it were your own project. Be as specific as possible with your suggested changes/solutions.

## Comments

1. Updated colors to be computed vars instead of func's so they read a tad better.

2. Two date constants were unused. While I understand having a complete list of constants might be nice, I chose to clean up this unused code.

3. Removed the actionBlue function from UIColor+Extensions because it wasn't used.

4. 