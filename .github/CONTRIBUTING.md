# How to contribute

## Running the app locally

---

### IDE (Integrated Development Environment) setup

#### Visual Studio Code

The easiest way to set up your development environment (unless you have [Codespaces](https://github.com/features/codespaces/), which is even easier) is to use [Visual Studio Code](https://code.visualstudio.com/)'s [Remote Containers](https://code.visualstudio.com/docs/remote/containers) functionality:
  * [System requirements](https://code.visualstudio.com/docs/remote/containers#_system-requirements)
  * Checkout the `british-prescription-data` project if you are a collaborator on the project
  * Or [Fork the project](https://docs.github.com/en/github/collaborating-with-issues-and-pull-requests/working-with-forks) if you are not
  * [Open the local project folder in a container](https://code.visualstudio.com/docs/remote/containers#_quick-start-open-an-existing-folder-in-a-container)
  * Everything will then be setup for you.


#### Codespaces

If you have access to [GitHub Codespaces](https://github.com/features/codespaces/) (which allows full remote
development from within your browser) then all you need to do is [open this repository in Codespaces](https://github.com/codespaces) - easy!

---

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


- A [MongoDB Atlas](https://www.mongodb.com/cloud/atlas) cloud account (free plan)
  1. **[Sign up for a new account](https://www.mongodb.com/try)** if you do not already have one
  2. Choose the **free tier**
  3. **Create a cluster** as prompted and name it **`british-prescription-data`**
     - Wait for the cluster to be created (takes a few minutes)
  4. Click on the `Get Started` green helper link on the bottom left
  5. Choose **`Create your first database user`**
  6. Keep to the default Authentication Method choice as `Password`
  7. Enter **`developer`** as the user name
     - For the password, choose **`Autogenerate Secure Password`**, then copy and save it
     - all the other defaults are fine, no need to change them
  8. Choose **`Whitelist your IP address`** on the `Get Started` green helper menu
     - Choose **`Allow access from anywhere`**
  9. Choose **`Connect to your cluster`** on the `Get Started` green helper menu
     - Choose **`Connect with the mongo shell`**
     - Copy just the MongoDB host name from the Connection
         
         i.e. copy just the bit that looks like this:
         
         `british-prescription-da.xxxxx.mongodb.net`
         
         Save this MongoDB host name somewhere temporarily (you will add it to SecretHub in the next step)

- Add your MongoDB details to SecretHub
  1. Log in to SecretHub if you are not already logged in:
     - `secrethub init --backup-code <your-secrethub-credential>`
  2. run this script from the root folder of the project:
     - `./scripts/add-mongodb-details-to-secrethub.sh`
  
---

### Importing the prescription data into MongoDB

- NB you only need to run `secrethub init` once on your development machine (or Codespace):

  `secrethub init --backup-code <your-secrethub-credential>`

- Now run this script from the root folder of the project:

  `./scripts/secrethub-wrapper.sh`

---
  