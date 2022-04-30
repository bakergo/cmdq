# cmdq, go fast

Have you ever started a build and wanted to do something *RIGHT AFTER* it was done?

Do you have a bunch of rote commands you fire off in the morning, never to look at them again?

Do you often find yourself damning the torpedos and typing the next command before your last finished?

cmdq is meant to help with that workflow. Run your commands in one window, and watch them execute in a separate one.

* cmdq is secure -- it uses local file pipes to pass these commands through.
* cmdq is fast -- it uses local file pipes to execute, no sleeping or polling time is wasted.

Also it's like 4 core lines of code and a little bit of boilerplate.

## Setup

### Clone the repository. 

```
$ localpath="$HOME/src/cmdq"
$ git clone github.com/bakergo/cmdq "${localpath}"
```

### Add the files to your PATH

```
echo "export PATH=\$PATH:${localpath}" >> ~/.bashrc
```

### Run the "Server"

```
$ cmdq
```

### Run the "Client"

```
$ q ls
```

### Wait, no output?

It's on the server's terminal :mindblown: !!!!1

