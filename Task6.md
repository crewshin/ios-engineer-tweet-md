## Task 6
One of our core values at Doximity is to leave the code better than you found it.

For this task, please take a look at the TweetMD project as a whole (as if you were performing a code review on the entire code base) and list out any changes you would make if it were your own project. Be as specific as possible with your suggested changes/solutions.

## Comments

1. Updated colors to be computed vars instead of func's so they read a tad better and are more in line with standard iOS standards.

2. Two date constants were unused. While I understand having a complete list of constants might be nice, I chose to clean up this unused code.

3. Twitters default avatar size is 48x48 but the TweetMD specs ask for a 50x50 avatar image. I just wanted to point out the fact that it might make sense to update the imageView to the image size since they are so close in size to reduce any up-sampling issues.

4. I think it's good habit to organize files in this order:
    * Protocols
    * Classes/Structs
        * Properties/Computed Properties/IBOutlets
        * Initializers
        * IBActions
        * Funcs
        * Extensions
    So I did a quick cleanup pass.

5. RE: Favorites. It's a bit out of scope for this test, however if this was a real app I'd consider implementing some kind of persistance. Realm, sqlite, etc. to store user favorites instead of my simple ephemeral storage implementation. edit: I see this is called out in the instructions now.

6. I noticed that in the `TweetDetailVM` class, we are importing UIKit. I typically don't import anything UIKit related into VM's so I would probably refactor this a tad. edit: I refactored this to a simple implementation.