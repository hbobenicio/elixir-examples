# OTP-NOTES

Notes on my personal study for OTP architecture

## OTP Patterns

* Process
* GenServer
* Tasks
* Agents
* Supervisor
* Application
* GenStage
* GenFlow

#### Process

* An isolated lightweight thread of execution abstraction.
* Communication is made by message passing using `send` and `receive`
* Every Process owns a mail box, on which messages are queued and serialized
* Failure can be isolated (`spawn`) or propagated through links (`spawn_link`)

#### Tasks

* A Process that executes some single... task (duh!), then quits
* `Task.start/1` and `Task.start_link/1`
* `Task.async/1` and `Task.await/1`

#### GenStage

* It is a "specification and computational flow for Elixir"
* Provides a way to define a pipeline of work

#### Application

* A component that can be started and stopped as a unit
* Can also be reused in other systems.
