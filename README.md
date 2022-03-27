# Viable

Viable helps organizations become more effective by modeling their operations using the [Viable System Model](https://en.wikipedia.org/wiki/Viable_system_model). Viable provides tools to organizations to label and regulate their subsystems. Viable can be used to diagnose missing (necessary) organizational functionality and communication channels, and may eventually allow real-time insight into an organization's health.


## The Viable System Model

Inspired by the principles of cybernetics, the Viable System Model (VSM) was developed and refined by Stafford Beer for effective organizing of complex systems autonomous systems. The VSM provides a framework for prefigurative autonomous organizations to coordinate and adapt at the appropriate scale. Chile's first democratically elected socialist government built [Project CyberSyn](https://en.wikipedia.org/wiki/Project_Cybersyn) in the early 1970s to apply the VSM to successfully coordinate its economy. For further reading, please see [Brain of the Firm](https://www.goodreads.com/en/book/show/1304488.Brain_of_the_Firm).

![The Viable System Model](/docs/vsm_simple.png)

[Click here](#detailed-vsm) for a more detailed view of the VSM.


## Development

The project is currently an [Elixir Phoenix](https://www.phoenixframework.org/) application that uses [Ash Framework](https://www.ash-elixir.org/) for efficiently creating APIs and resources. Viable uses PostgreSQL as its database.

### Setup

Viable uses [`asdf`](https://github.com/asdf-vm/asdf) as its language version manager. As of this writing, we are using Elixir version `1.13.3-otp-24` and Node version `17.5.0`. Set up `asdf` with the [Elixir plugin](https://github.com/asdf-vm/asdf-elixir) and the [Node.js plugin](https://github.com/asdf-vm/asdf-nodejs) and run `asdf install`. Once Elixir is installed, install dependencies with


`mix deps.get`


then run `mix ecto.create` to create the postgres database. If `picosat_elixir` fails to compile, you may need to run `unset LDFLAGS`.


#### Node

To set up node dependencies, `cd assets` and run `npm install`. Go back to the project directory, run the server with

`iex -S mix phx.server`.

and visit `http://localhost:4000` in your browser.


### Domain model

The current resources are:

#### System 
All systems/functionalities. These are known as subsystems 1 through 5 in the VSM. System 1 is the unit of autonomy in a group, and itself contains a full set of systems 1-5. The top-most system is therefore considered a System 1 of its own.

Column | Type | Description
-------|:----:| -----------
id | uuid | Automatically created
name | string | Name of the system (e.g. 'Kitchen operations' for a System 1 in a restaurant)
description | string | Description of the system, (e.g. 'Assign tasks for the day using whiteboard' as a system 2 coordinating function)
level | enum | System number/level: {one, two, three, three_star, four, five}
parent_id | uuid | The parent System 1 this subsystem belongs to


#### Environment
All environments (overall and sub-environments).

Column | Type | Description
-------|:----:| -----------
id | uuid | Automatically created
name | string | Name of the external environment - suppliers, other orgs, etc
parent_id | uuid | If useful, the meta-environment this belongs to. e.g. federation, collective


#### Channel
All information/communication channels between systems and/or environments.

Column | Type | Description
-------|:----:| -----------
id | uuid | Automatically created
name | string | Name of the channel if useful (e.g. "resource bargain", "check-in/auditing")
from_system_id | uuid | System ID source
to_system_id | uuid | System ID destination
from_environment_id | uuid | Environment ID source
to_environment_id | uuid | Environment ID destination


## API Usage
The app uses [`ash_json_api`](https://hexdocs.pm/ash_json_api/readme.html) to offer a full [json:api](https://jsonapi.org/)-specified API for interacting with the data layer. Each resource (systems, environment, channel) has related routes for reading and modifying data. Requesting a list of systems with `level=five` looks like:

`curl -g -s --url 'http://localhost:4000/api/systems?filter[level]=five' | jq`

The other resources are accessed via `/api/environments` and `/api/channels`. Further examples are found under `data/examples.sh`.


## Next steps
The sky's the limit! The UI has initially been developed using [Phoenix LiveView](https://hexdocs.pm/phoenix_live_view/Phoenix.LiveView.html) but the API works with any other frontend. Some ideas (which may be mutually exclusive):

- Continue to use LiveView for realtime collaboration
- Switch to React for potentially faster development with familiar tools
- Create a zoomable interface like [Eagle Mode](http://eaglemode.sourceforge.net/emvideo.html)
- Create an open-ended experience for drawing systems, environments, etc. onto a 2D canvas
- Further develop how channels can [measure performance](https://en.wikipedia.org/wiki/Viable_system_model#Measuring_performance) and raise algedonic alerts

## Resources

- [Elixir guide](https://elixir-lang.org/getting-started/introduction.html)
- [Phoenix guide](https://hexdocs.pm/phoenix/overview.html)
- [Ash Framework repository](https://github.com/ash-project/ash)
- [Ash Framework guide](https://hexdocs.pm/ash/getting_started.html)
- [Brain of the Firm](https://www.goodreads.com/en/book/show/1304488.Brain_of_the_Firm)


## Detailed VSM illustration
![Detailed VSM](/docs/vsm_full.svg)
