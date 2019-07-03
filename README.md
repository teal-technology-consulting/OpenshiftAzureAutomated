Readme 

--- English version below --- 

Für mehr Informationen zu dem Zweck und dem Kontext von diesem Repository besucht unseren Blog: https://teal-consulting.de/index.php/blog/openshift-automatisierte-installation-in-azure  

## Vorraussetzungen 

### Workstation 

Die Skripte wurden auf einem RHEL-System geschrieben, können aber grundsätzlich auf allen Linux-Systemen und sogar dem Windows-Subsystem für Linux ausgeführt werden (möglicherweise musst Du zusätzliche Pakete wie zum Beispiel m4 installieren). Auf einem REL-System müssen die Pakete "az" und "jq" installiert werden: 

Um az zu installieren, folgt den aktuellsten Anweisungen hier https://docs.microsoft.com/de-de/cli/azure/install-azure-cli-yum?view=azure-cli-latest  

Zur Installation von jq könnt ihr die Befehle "yum install -y epel-release" gefolgt von "yum install -y jq" ausführen oder die hier beschriebenen fortgeschrittenen Methoden nutzen https://github.com/stedolan/jq/ 

### Redhat Account 

Da eine lizenzierte Version von Openshift installiert wird, benötigt Ihr ein RedHat-Konto mit Abonnements für Openshift und dotNet. Außerdem müssen die allgemeinen Bedingungen von Redhat akzeptiert werden. Wenn Ihr das noch nicht getan habt klickt auf folgenden Link  https://www.redhat.com/wapps/tnc/ackrequired?site=candlepin&event=signOn . 

Als nächstes müsst Ihr die Pool-ID kennen. Da es keine Möglichkeit gibt, die Pool-ID im Portal zu sehen, benötigen ihr ein registriertes REL-System, um den folgenden Befehl auszuführen:  subscription-manager list -available 

### Azure Account 

Ihr benötigt ein gültiges Azure-Konto und mindestens Contributor Rechte für das Abonnement. Weiterhin muss die vCPU Quota höher als 28 sein (siehe https://docs.microsoft.com/en-us/azure/azure-supportability/resource-manager-core-quotas-request). Einige kostenlose und gesponserte Konten haben niedrigere Limits, können aber wie im obigen Link beschrieben erhöht werden. 

## Ausführung 


* Ladet das Repo herunter und entpackt es in einen lokalen Ordner  

* Meldet euch bei Azure mit "az login" an. 

* Benennt die Datei variables.env.template in variables.env um und füllt die Variablen aus. Eine Erklärung der Variablen findet Ihr in der Datei 

* Führt folgenden Befehl aus: "./prepare.sh || ./clear.sh". 

* Die URL zur Openshift Console findet Ihr am Ende des Outputs oder in der Datei output.log 



Die Ausführungszeit kann je nach Region variieren. Es kann bis zu 2,5 Stunden dauern. 

Wenn etwas schief geht, bestätigt die Nachfragen des Skripts clear.sh, um die Umgebung für einen neuen Versuch zu bereinigen.  

 

### Erweiterte Ausführung 

Wenn Ihr weitere Parameter der Installation ändern möchtet, könnt Ihr dies in der Datei "azuredeploy.parameters.json.m4" tun. Die Erklärung der Parameter finden Sie im Microsoft Repo unter https://github.com/Microsoft/openshift-container-platform  

 

## Grundlegendes Troubleshooting 

Microsoft Deployment Dokumenation auf Github: https://github.com/Microsoft/openshift-container-platform . 

Allgemeiner Überblick von Microsoft über die Funktionsweise von Openshift in Azure https://docs.microsoft.com/en-us/azure/virtual-machines/linux/openshift-get-started  

Ihr könnt euch an die Fehlerbehebungsanleitung hier https://docs.microsoft.com/en-us/azure/virtual-machines/linux/openshift-troubleshooting  halten, falls Sie Fehler finden. Sollte irgendwas nicht klappen meldet euch bei uns, wir helfen gerne. 

 
--- English verison--- 

For more information about the purpose and context of this repository visit our blog: 

English: https://teal-consulting.de/index.php/blog/openshift-automated-installation-in-azure  

## Prerequisites 

### Workstation 

The scripts were written on a RHEL system but can basically be executed on all Linux systems and even the Windows Subsystem for Linux (you might need to install additional packages like m4). On a REL system you need to install the “az” and “jq” package: 

To install az, follow the most current instructions here https://docs.microsoft.com/de-de/cli/azure/install-azure-cli-yum?view=azure-cli-latest  

To install jq you can run the commands “yum install -y epel-release” followed by “yum install -y jq” or follow the more advanced methods described here https://github.com/stedolan/jq/ 

### Redhat Account 

As a licensed version of Openshift will be installed you need a RedHat account with subscriptions for Openshift and dotNet. Further, you need to agree to the terms of Redhat. If you have not yet done so click on the following link https://www.redhat.com/wapps/tnc/ackrequired?site=candlepin&event=signOn 

Next you need to know the Pool ID. As there is no way to get the Pool ID in the portal you need a registered REL system to run the following command to find the Pool ID: subscription-manager list -available 

### Azure Account 

You need a valid Azure account and at least contributor permissions on the subscription. Further  the vCPU quota must be higher than 28 (check https://docs.microsoft.com/en-us/azure/azure-supportability/resource-manager-core-quotas-request  ). Some free and sponsored Accounts have lower limits but can be increased as described in the link above. 

## Execution 


* Download and extract the repo to a local folder 

* Login to Azure using “az login“ 

* Rename variables.env.template to variables.env and fill out the variables. An explanation of the variable can be found in the file 

* Run "./prepare.sh || ./clear.sh" 
    
* Find the URL to the Openshift console as the last output or in output.log 


The execution time might vary by region. It can take up to 2.5 hours. 

If something goes wrong be sure to answer the prompts of the clear.sh script to cleanup the environment for a new try.  

### Advanced Execution 

If you want to change more parameters of the installation you can do so in the file “azuredeploy.parameters.json.m4”. The explanation for the parameters can be found in the Microsoft Repo at https://github.com/Microsoft/openshift-container-platform 

 

## Basic Troubleshooting 

Microsoft deployment documentation in Github: https://github.com/Microsoft/openshift-container-platform. There is full explicit description of parameters of Azure deployment 

General overview from Microsoft about how to run Openshift inside Azure https://docs.microsoft.com/en-us/azure/virtual-machines/linux/openshift-get-started  

You might refer to troubleshooting guide here https://docs.microsoft.com/en-us/azure/virtual-machines/linux/openshift-troubleshooting in case if you will find errors. Do not hesitate to contact us, we are ready to help you 

 