# Numworx Installation

Are you willing to install your own NumWorx environment yourself?
- on your laptop?
- somewhere in the cloud? For example EKS, AKS, GKS

## Instructions for “on your laptop”
For that, you can use the “Rancher Desktop” application on your own computer.
There are other applications you can use as well, but this one is fairly click-and-go.
You need to enable the traefik ingress controller.

In the next sections a minimal setup is described
- the http://app.numworx server for the backend and the primary resources
- the http://cds.numworx a content delivery server for additional resources

A local mysql and redis server are installed for database and caching.

Optional are a few extra resources.
- a XMPP chatserver based on prosody. Numworx has a build-in chat client.
- a LRS server, when you wish to use learning objectives, based on lrsql
- a metrics server, based on prometheus.
- a logging and metrics client, grafana

## And then:
Fork this git repository numworx-dwo-setup
Do you have a GitHub account?
Do you have a GitHub token? export GITHUB_TOKEN=....

For now, still in the development branch

### This step is still necessary because it is not yet fully open source:
 
- Go to the *base*
- Create the Numworx namespace
- Install your GitHub token as a secret with "ghcr-secret.sh"

### Next, step 2, in the future the only step required if you want to use the UU containers.

- Go to *local*
- Start the installation in a terminal with “kubectl apply -k .”
- Just wait a moment
- Create 2 aliases for localhost: app.numworx and cds.numworx

In /etc/hosts, it then says:

```
        127.0.0.1      localhost app.numworx cds.numworx
```

### Step 3:

- Open your browser at http://app.numworx/
- choose a profile, log in as a guest or as “dwoadmin” with password “dwoadmin”
- Random users can register at http://app.numworx/dwo/register/RegisterFree.jsp

### Step 4 is still open:

- Download the “local” NumworxAuthor application and launch it to connect to http://app.numworx/dwo/. You can find the link on the homepage.
- you can find an HTML authoring environment at http://app.numworx/dwo/numworxauthor.html
- Logs in as dwoadmin, create schools for your own use. Create standard modules and activities.

### Extensions

The SMTP service is not configured. You can send mail, but it will probably no longer be accepted anywhere.
There is a *chat* expansion using Prosody. Students can chat with their teacher and with each other.
The learning objectives system can store results in a Learning Record Store (LRS). This is made possible using lrsql.
In addition to Python in the browser, a connection has also been made with Jupyter Notebooks. For this, an extra *hub* service must be configured.
Metrics and logging. The dwoproject pod has a /metrics endpoint for promethues. The logging is forwarded to a loki service. As an extension, a prometeus service and Grafana dashboard can be created.

## Finally

What is the difference between “local” and “somewhere in the cloud”

- then you have configured an official MySQL database. Backups are properly managed.
- then you have Kubernetes in the cloud and Kubectl that can communicate with it.
- you have configured an ingress controller, for example “Traefik"
- You have your own domain provider where you can create app.mijndomein.nl and cds.mijndomein.nl.
- enter those 2 names where necessary in place of 'app.numworx' and 'cds.numworx'
- You generate HTTPS certificates via Cert-Manager. That happens automatically.
- Select and configure which extensions you want to use. The SMTP service deserves particular attention. Make use of your cluster provider's content delivery network.
- starting the installation with “kubectl apply -k <directory>” then works as usual again.
- you configure your own Numworx Author application and place the correct link on the homepage.
