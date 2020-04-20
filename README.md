# Pong-curses [![BuildWorkflow](https://github.com/vicentebolea/Pong-curses/workflows/BuildWorkflow/badge.svg)](https://github.com/vicentebolea/Pong-curses/actions?query=workflow%3ABuildWorkflow)

Pong-curses is a 71 lines pong game written in C with NCURSES lib. I created it on my first semester during my CS undergraduate. It's super simple and small but it works!

![PongCurses](https://raw.githubusercontent.com/vicentebolea/Pong-curses/gh-pages/pong.png)

## COMPILE ME (UBUNTU/DEBIAN)

You maybe have to install ncurses library. So to install type:

    $ sudo apt-get install libncurses5-dev 

Go to its directory and tip:

    $ cc pong.c -lncurses -o pong 

Then:

    $ ./pong 


## AUTHOR 
- Vicente Adolfo Bolea Sanchez <vicente.bolea@gmail.com>
