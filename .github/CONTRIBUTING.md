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

### Importing the prescription data into MongoDB and then into Kafka

#### Importing into MongoDB

- NB you only need to run `secrethub init` once on your development machine (or Codespace):

  `secrethub init --backup-code <your-secrethub-credential>`

- Now run this script from the root folder of the project:

  `./scripts/secrethub-wrapper.sh`

  The data will now be in MongoDB, with each presecription record being stored as a separate 
  [MongoDB document](https://docs.mongodb.com/manual/core/document/)


#### Importing from MongoDB into Kafka

1. Create a cluster on Confluent Cloud - call it `british-prescription-data`
2. Go to connectors
3. Choose MongoDB Atlas Source
4. Generate an API key and secret
    - enter `british-prescription-data` in the description field
	  - save the API key and secret somewhere safe
5. Enter `british-prescription-data` as the topic prefix
6. Enter your MongoDB connection details
    - You can read the connection host from SecretHub:
	  - `secrethub read agilepathway/british-prescription-data/<your-secrethub-username>/mongodb-host`
	  - Connection User: `developer`
	  - You can read the connection password from SecretHub:
	  - `secrethub read agilepathway/british-prescription-data/<your-secrethub-username>/mongodb-password`
	  - Database name: `british-prescription-data`
	  - Collection name `british-prescription-data`
7. Set "Copy existing data" to true
8. Set "Number of tasks for this connector" to 1
9. Launch the connector

Now you can see the messages in Kafka:

1. Click on topics in the navigation menu
2. Select your newly created topic
3. Click on messages
4. Enter `0 / Partition: 0` in the Offset field

---
