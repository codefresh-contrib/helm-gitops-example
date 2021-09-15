# Flaskr example application written in Python/Flask with Helm chart

[Flask plus Codefresh](docker-flask-codefresh.jpg)

Original source code from: https://github.com/pallets/flask/tree/master/examples/tutorial

## To use this project with GitOps/Argo CD

This is a python/flaskr application including a Helm chart.

#### Prerequisites

- Access to a Kubernetes cluster
- Installing and configuring [Helm](https://helm.sh). Please refer to
Helm's [documentation](https://helm.sh/docs) to get started.

#### Helm commands

Once Helm has been set up correctly, add the repo as follows:

`helm repo add argo https://argoproj.github.io/argo-helm`

"argo" has been added to your repositories

`helm install my-release argo/argo-cd`

Confirm the new release "my-release" has been created. This is done by executing helm list (or helm ls) function which will show you a list of all deployed releases:

`helm list`

If you need to uninstall this release:

`helm uninstall my-release`

Now that the Helm chart has been released, you can now deploy it with Argo CD.

#### Install Argo CD

First, you need to install Argo and in order to do this, please follow [this tutorial.](https://argoproj.github.io/argo-cd/getting_started/)

Once logged into Argo CD, navigate to +NEW APP on the left hand side of the UI. Then add the following to create the application:

#### General:

- Application Name: helm-gitops-example
- Project: default

#### Source:

- Repository URL/Git: this GitHub repository URL
- Branches: main
- Path: charts/python

#### Destinatin

- Cluster URL: select your cluster URL you are using
- Namespace: default

Then, click CREATE. You have now created your Argo application and it will read out all the parameters, and also read the source Kubernetes manifests. The application will be OutOfSync state since the application has yet to be deployed, and no Kubernetes resources have been created.

#### Synchronize the application manifests and deploy the Argo application

Initially the application is in OutOfSync state since the application has yet to be deployed, and no Kubernetes resources have been created. To synchronize/deploy the Argo app, chose the tile and then select SYNC. This will provide you options of what you want to synchronize.
Select the default options and synchronize all manifests. Once its deployed, you will see the resources deployed in the UI.

#### Access the Argo application outside Kubernetes cluster

Within this application the values.yaml file is derived of parameters from which are the same path as the Helm chart. You can access this by clicking on your new application in the Argo UI and clicking on the PARAMETERS tab. Make sure your values.yaml file is chosen for the VALUES FILES field. Within this file includes the service port `5000` value inside the application configuration.

Point the browser to http://localhost:5000 and view the application.