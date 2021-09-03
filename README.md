# elixir-examples

My personal elixir examples


## Elixir is ...

* A dynamic and functional programming language
* It's used for scalable, maintainable, distributed, fault-tolerant applications
* Runs on the Erlang VM (known for running low-latency, distributed and fault-tolerant systems)
* successfully used in web development and the embedded software domain.

## Instalation

### The problem with asdf-vm erlang plugin and Ubuntu 20.04

I used to use the [erlang plugin](https://github.com/asdf-vm/asdf-erlang/) for [asdf-vm](https://asdf-vm.com/) as my installing process.

Unfortunately, it became really buggy at least on my Ubuntu 20.04, specially in blindlessly missing my standard libssl-dev installation.

Actually, this is not a direct issue of the plugin but an issue on [kerl](https://github.com/kerl/kerl) itself, which is used to build erlang.

Kerl tries to guess that my openssl installation is prefixed in a simple path, which is not true for libssl-dev on ubuntu 20.04.
The main header is at `/usr/include/openssl/ssl.h` and lib is at `/usr/lib/x86_64-linux-gnu/libssl.so`, but unfortunatelly kerl appears to only use the flag `--use-ssl` that points to the prefix installation of openssl... and it still misses headers and libs even with `--use-ssl=/usr`.

So sad.

Do just use the official apt repository and its packages from the erlang solutions itself. Here it is how:

### Installing Erlang from precompiled binaries from the Erlang Solutions official repository

```bash
sudo apt-get install build-essential autoconf m4 libncurses5-dev libwxgtk3.0-gtk3-dev libgl1-mesa-dev libglu1-mesa-dev libpng-dev libssh-dev unixodbc-dev xsltproc fop libxml2-utils libncurses-dev # you don't need all of these for a minimal functional running erlang installation, but for developtment it's really handy, specially for the observer GUI monitor
wget -O- https://packages.erlang-solutions.com/ubuntu/erlang_solutions.asc | sudo apt-key add -
sudo apt-add-repository "deb https://packages.erlang-solutions.com/ubuntu focal contrib"
sudo apt update
sudo apt install erlang # other recommended packages: erlang-manpages erlang-doc lksctp-tools tcl-tclreadline
erl # check if it's ok. ctrl+c twice to quit
```

### Installing Elixir with asdf-vm elixir plugin

Now with erlang successfully installed, in elixir asdf-vm plugin we trust!

```
asdf plugin-add elixir
asdf install elixir 1.12.2-otp-24
asdf global elixir 1.12.2-otp-24
asdf reshim
iex
iex(1)> :observer.start
```

You should see the observer wxWidgets GUI application running.

