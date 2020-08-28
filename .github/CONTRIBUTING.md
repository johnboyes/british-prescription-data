# How to contribute

## Running the app locally

### Prerequisites

- A [Confluent Cloud](https://www.confluent.io/confluent-cloud) account 
(3 month free trial when you signup)

- A [SecretHub](https://secrethub.io/) account:
  - [Install the SecretHub CLI](https://secrethub.io/docs/reference/cli/install/) - or open this repository in a [Codespace](https://github.com/features/codespaces/), which has the CLI pre-installed
  - Sign up:
    - `secrethub signup`
  - Create a [SecretHub backup credential](https://secrethub.io/docs/reference/cli/credential/#backup)
    and keep it in a safe place:
    - `secrethub credential backup` 
  - Ask a [core maintainer of this project](CODEOWNERS) to be added to the project's SecretHub org, giving them your SecretHub username.
    - You must wait for the core maintainer to confirm that you are set up on the SecretHub org before you can proceed.


### Visual Studio Code

The easiest way to set up your development environment (unless you have [Codespaces](https://github.com/features/codespaces/), which is even easier) is to use [Visual Studio Code](https://code.visualstudio.com/)'s [Remote Containers](https://code.visualstudio.com/docs/remote/containers) functionality:
  * [System requirements](https://code.visualstudio.com/docs/remote/containers#_system-requirements)
  * Checkout the `british-prescription-data` project if you are a collaborator on the project
  * Or [Fork the project](https://docs.github.com/en/github/collaborating-with-issues-and-pull-requests/working-with-forks) if you are not
  * [Open the local project folder in a container](https://code.visualstudio.com/docs/remote/containers#_quick-start-open-an-existing-folder-in-a-container)
  * Everything will then be setup for you.


### Codespaces

If you have access to [GitHub Codespaces](https://github.com/features/codespaces/) (which allows full remote
development from within your browser) then all you need to do is [open this repository in Codespaces](https://github.com/codespaces) - easy!


### Importing the prescription data

- NB you only need to run `secrethub init` once on your development machine (or Codespace):

  `secrethub init --backup-code <your-secrethub-credential>`

- Now run this script from the root folder of the project:

  `./scripts/secrethub-wrapper.sh`
  