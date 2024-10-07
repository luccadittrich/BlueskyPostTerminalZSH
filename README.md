# BlueskyPostTerminalZSH

STEPS to post in bluesky directly from your Linux terminal

use zsh or similar

* 1 Copy code to any folder in your computer

* 2 Change APP_PASSWORD and HANDLE

* 3 Get an app password from here: https://staging.bsky.app/settings/app-passwords

* 4 create an alias to call the code in the terminal
in my .zshrc:

   alias bluesky='/home/harrypotter/Projects/sh/blu.sh'

* 5 call the alias in the terminal using "" to your message.
example:

  $ bluesky "your message goes here"
