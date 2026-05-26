# Instalatie Numworx

Ben je nog bereid om zelf eens een eigen numworx omgeving te installeren.
- op je laptop?
- ergens in de cloud?

## Op dit moment instructies voor “op de laptop” 
Daarvoor kan je de “Rancher Desktop” applicatie gebruiken op je eigen computer.
Er zijn ook andere applicaties die je kan gebruiken, maar deze is redelijk klik-en-klaar

## En dan:
Download de git repository numworx-dwo-setup
Heb je een GitHub account? 
Heb je een GitHub token? export GITHUB_TOKEN=....

Voorlopig nog in de develop branch

### Deze stap is nog omdat het nog niet helemaal opensource is:
	- Ga naar de *base*
	- Creer de Numworx namespace
	- Installeer je GitHub token als een secret met "ghcr-secret.sh”
### Daarna stap 2, in de toekomst de enige stap die nodig is als je van de UU containers gebruik wilt maken.
	- Ga naar *local*
	- Start in een terminal de installatie met “kubectl apply -k .”
	- Effe wachten
	- Maak 2 aliassen aan voor localhost: app.numworx en cds.numworx
	  In /etc/hosts staat dan:
    	  127.0.0.1	localhost app.numworx cds.numworx
### Stap 3:
	- Open je browser op http://app.numworx/
	- kies een profiel, login als gast of als “dwoadmin” met wachtwoord “dwoadmin”
	- Willekeurige gebruikers kunnen zich aanmelden op http://app.numworx/dwo/register/RegisterFree.jsp

### Stap 4, staat nog open:
	- Je download de “lokale” NumworxAuthor applicatie en start die om verbinding te zoeken met http://app.numworx/dwo/. De link vind je op de homepage.
	- een html auteurs omgeving vind je in http://app.numworx/dwo/numworxauthor.html
	- Logt in als dwoadmin, maak scholen aan voor eigen gebruik. Maak standaard modules en activiteiten.

### Uitbreidingen
 * De SMTP service is niet geconfigureerd. Je kan wel mail versturen, maar dat wpordt waarschijnlijk nergens meer geaccepteerd.
 * Er is een *chat* uitbreiding met behulp van prosody. Leerlingen kunnen met hun leraar chatten en onderling.
 * Het leerdoelen systeem kan resultaten opslaan in een Learning Record Store (LRS). Met behulp van lrsql wordt dit mogelijk gemaakt.
 * Behalve Python in de browser, is er ook een koppeling gemaakt met Jupyter Notebooks. Daarvoor moet een extra *hub* service worden ingericht.
 * Metrics en logging. De dwoproject pod heeft een /metrics endpoint voor promethuis. De logging wordt doorgestuurd naar een loki service. Als uitbreiding kan een prometeus service en grafana dashboard gemaakt worden.

## Tenslotte

Wat is het verschil tussen “lokaal” en  “ergens in de cloud”
	- dan heb je een officiële mysql database geconfigureerd. Backups goed geregeld.
	- dan heb je kubernetes in de cloud en kubectl die daarmee kan communiceren.
	- je hebt een ingress controller geconfigureerd, bijvoorbeeld “Traefik"
	- je hebt een eigen domein provider waar je app.mijndomein.nl en cds.mijndomein.nl kunt aanmaken.
	- die 2 namen vul je in waar nodig op de plaats van ‘app.numworx’ en ‘cds.numworx'
	- je genereert https certificaten via cert-manager.  Dat gaat dan vanzelf
	- Kies en configureer welke uitbreidingen je wilt gebruiken. Met name de SMTP service verdient aandacht. Maak gebruik van het content delivery network van je cluster provider.
	- start de installatie met “kubectl apply -k <directory>” gaat dan weer als vanouds.
	- je configureerd een eigen Numworx Author applicatie en zet de correcte link op de homepage.



