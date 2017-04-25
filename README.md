# elixir-examples

My personal elixir examples


## Elixir is ...

* A dynamic and functional programming language
* It's used for scalable, maintainable, distributed, fault-tolerant applications
* Runs on the Erlang VM (known for running low-latency, distributed and fault-tolerant systems)
* successfully used in web development and the embedded software domain.

## Instalation

* I'm using [asdf-vm version manager](https://github.com/asdf-vm/asdf)
to manage the elixir version of my system.
This way I can avoid versions and dependencies collision
of my projects (and easily keep elixir updated).
  * First, you need to install Erlang. Follow these steps:
  ```bash
  asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git
  asdf list-all erlang #Pick the latest version
  asdf install erlang 19.3 #ATM, the latest verion is 19.3
  asdf global erlang 19.3 #Use this version as default
  asdf current erlang #Check if installation succeeded
  ```
  * Then do the same process for elixir now:
  ```bash
  asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir
  asdf list-all elixir #Pick the latest version
  asdf install elixir 1.4.2 #ATM, the latest version is 1.4.2
  asdf global elixir 1.4.2 #Use this version as default
  asdf current elixir #Check if installation succeeded
  mix local.hex #Now you're good to go with mix. Update it. Done.
  ```

## Interactive Elixir (iex)

* You can play around elixir anytime you want with iex. Just type on your console/terminal:
```bash
iex
```
* An interactive prompt will show up. Play with it!
* press Ctrl+C twice to shut it down

