EDA095 - Nätverksprogrammering
==============================

Föreläsning 1
-------------

### Lager

För att två program ska kunna kommunicera, så krävs det att de använder sig av samma protokoll.
Det finns flera lager inom nätverkskommunikation som har olika uppgifter och använder sig av olika protokoll.

#### Applikationslagret

När ett program tar emot bits & bytes så översätter den det till motsvarande meddelande, bestämt av programmet.
Helt programspecifikt.

#### Transportlagret

Transportlagret bidrar till att applikationer ska kunne skicka meddelanden mellan varandra. 
Med hjälp av portnummer, som är en rent logisk abstraktion, mappas meddelanden till rätt applikation.
De två vanligaste protokollen är TCP (Transmission control protocol) och UDP (User datagram protocol).

TCP har en fast (logisk) uppkoppling över nätverket.
Dataström, dvs. data behöver inte delas upp i paket.
Automatisk felkontroll/omsändning. Garanterad
leverans och inbördes ordning

UDP använder sig av datagram.
Upp till 65507 byte stora datagram (IPv4)
Garanterat korrekta meddelanden.
Ej garanterad leverans eller inbördes ordning. 

#### Internetlagret

Internetlagret bidrar till att program ska kunna koppla upp sig till rätt nätverksenhet. 
Detta sker med hjälp av IP (internet protocol), och är en addressering som kan jämföras med gatuaddress.
Idag finns det två varianter av IP, IPv4 och IPv6.

IPv4 använder sig av 4 bytes och kan exempelvis skrivas 130.235.16.34.

IPv6 använder sig av 16 bytes, exempel på samma adress som ovan i IPv6: 2001:fe0c::db:1dc0.

IPv6 har tillkommit på grund av att IPv4 numren börjar ta slut.
Båda varianterna kommer att användas parallellt i övergångsfasen.
Moderna datorer stödjer båda varianterna.
Mycket dåligt stöd bland ISPs.
Har lite inverkan på utvecklare, undvik dock antagandet att IP skrivs på x.x.x.x.

Domännamn kan användas istället för IP-nummer, med hjälp av DNS (domain name server) så översätts domännamnen till IP-nummer.
www.cs.lth.se = 130.235.16.34 

#### Fysiskt överföringsmedium

Omvandlar mellan analoga- och digitala signaler.

### Strömmar

En ström är en sekvensiell följd av bytes (tecken).
In- och utmatning sker oftast i form av strömmar: Inmatning
från tangentbordet, utskrift till ett terminalfönster.
Vi kan skriva bytes till strömmar och vi kan läsa bytes från
strömmar. Generell abstraktion.
Vi kan upprätta strömmar över ett nätverk: TCP 

InputStream representerar inkommande ström, t.ex. läsa från fil.

OutputStream representarar utgående ström, t.ex. skriva till fil.

Buffring av strömmar ökar effektiviteten, högre genomströmningshastighet.
Mer data som sänds/tas emot -> färre systemanrop/diskaccesser/nätverkspaket.
Klasserna BufferedInput/OutputStream implementerar buffring.
Glöm inte anropa flush!

Reader/Writer implementerar möjligheten att skicka/ta emot tecken utan att omvandla dessa till bytes manuellt.


Föreläsning 2
-------------

### Internet addresses

InetAddress är en abstraktion av klasserna Inet4Address och Inet6Address.
Representerar en IP adress.

NetworkInterface klassesn representerar hårvarukopplade enheter så som Ethernet of Wi-Fi.

SpamHaus.org tillhandahåller ett register av kända spammers.

### URL

En URL (Uniform resource locators) är ett namn på en resurs på internet och vilket protokoll som skall användas för att nå denne.
URL = protocol://hostname/path/object
Protokollet kan vara http, ftp, telnet, rmi, etc.
hostname är en internetadress.
path/object är adressen till en specifik fil/objekt på adressen.
URLs är definerade av RFC 2396 och RFC 2732.

Protokoll har default portar (http - 80)
En URL kan vara absolut eller relativ till base URL.
Ett URL kan skapas på 3 sätt:
 * URL(String spec)
 * URL(String protocol, String host, String file)
 * URL(URL context, String spec)

Exempel:
 * new URL("http://www.cs.lth.se/index.html");
 * new URL("http", "www.cs.lth.se", "/index.html");
 * new URL(new URL("http://www.cs.lth.se/EDA095/"),"labs.shtml");

Throws MalformedURLException If the string specifes an unknown protocol.

Klient-Server kommunikation sker enkelt sett med en TCP koppling från klienten till servern på port 80.
Klienten skickar request, servern svarar med en response.
Requesten består av ett command word (HTTP method) för att identifiera requesten, parametrar, och annan möjlig data.
Responsen består av en responskod och objekt som skall visas eller renderas av klienten.

HTTP request:
 1. HTTP method, URL, version
    GET /pierre_nugues HTTP/1.1
 2. Sequence of parameter names (46 types) followed by `:' and values pairs
    Name: Value
    Accept: text/plain
    ...
    Host: cs.lth.se
    User-Agent: Mozilla/4.0
 3. Empty line: \r\n
 4. Possibly a message body (data) whose size is given by the Content-Length attribute

HTTP response:
 1. Protocol, status code, textual phrase
    HTTP/1.0 200 OK
 2. Sequence of parameter names followed by `:' and values
    Date: Wed, 28 Mar 2007 12:12:54 GMT
    Server: Apache/2.0.52 (sparc-sun-solaris2.8)
    ...
    Connection: close
 3. Empty line: \r\n
 4. Data
    <html>
    ...
    </html>

#### URI

URIs är namnconventioner liknande URLs (RFC 2396)
[scheme:]scheme-specific-part[#fragment]
URIs kan vara absoluta (med ett scheme) eller relativa (utan).

En hierarkisk URI parsas enligt följande syntax:

[scheme:][//authority][path][?query][#fragment]
Om authority är en server så är syntaxen för denne:

[user-info@]host[:port]
User-info kan bestå av ett användarnamn och ett lösenord: 
anonymous:pierre@cs.lth.se

#### Dataöverföring

Klienter kan skicka data till HTTP servrar med hjälp av en lista av key-value par:

book=Java Network Programming
author=Harold

Detta används när man fyller i HTML formulär (forms), GET eller POST kan användas som metod.


##### GET

Skickar en lista av key-value par i URL'ns query del:

[scheme:][//authority][path][?query][#fragment]

Ex: Arg1=Value1&Arg2=Value2


Föreläsning 3
-------------

### Processer

Processer är exekverande program.
De flesta OS can köra flera processer parallellt.
OS allokerar en lite del av CPU tid till varje process.

Processer som körs finns i datorns minne.
De innehåller programkod (från kompileringen).
Ett dataområde som sparar dynamisk data allokeras av programmet under körning med hjälp av kommandot "new".
När ett program kallar på sina metoder/funktioner så sparar en stack deras parametrar.

Väntande processer står som "REDO", CPUn väljer en och markerar den som "ELECTED", vid I/O så flyttas en "ELECTED" process till "BLOCKED" tills I/On är klar.

Processer väljs utefter en scheduling-algorithm, exempelvis FIFO eller Priority.

Traditionella processer är sekventiella, Concurrent processer har multipla trådar körandes, dvs processer inom processen.

### Trådar

Trådar implementeras antingen genom att extenda Thread, eller implementa Runnable.

Schedulering kan antingen vara preemptive, eller cooperative:

 * En cooperativ schedulerare väljer tråden med högst prio, tills färdig eller yield kallas.
 * En preemptive schedulerare allokerar tid till alla trådar så att alla får köra, hög prio får mest tid.

Executors har en tråd-pool som utför jobb efterhand de submitas med hjälp av sin förbestämda mängd trådar.

#### Delade resurser

Busy wait: while(p); = DÅLIGT!

Använd: synchronized (Object){while(p){try{ wait();} catch(Exception e){}}} & notifyAll();

Deadlocks sker om två trådar har varsin resurs blockad och väntar på varandra. UNDVIK DETTA!
En enkel tråd kan inte deadlocka sig själv.

En tråd "dör" när den kört klart.


Föreläsning 4
-------------

### HTTP

Response codes:
 * 2xx: Success
 * 3xx: Redirection
 * 4xx: Client error
 * 5xx: Server error

HTTP versioner:
 * HTTP 1.0: En ny connection för varje request.
 * HTTP 1.1: Möjlighet till återanvändning av existerande TCP socket med Connection: keep-alive

Connection: keep-alive betyder att klienten är villig att återanvända samma socket

En klient kan skicka 8 olika typer av requests:
 * GET : hämta information som identifieras av request-URIn.
 * POST : skicka data till resursen
 * PUT : spara resursen som identifieras av request-URIn.
 * DELETE : radera resursen som identifieras av request-URIn.
 * HEAD : samma som GET men returnerar en respons utan data dvs endast med headers.
 * OPTIONS : returnerar stödda metoder.
 * TRACE : skickar tillbaka headern till klienten.
 * CONNECT : reserverat namn för att connecta till en TCP/IP tunnel.

En HTTP server måste minst implementera GET och HEAD.

HTTP POST header:
 1. HTTP method, URL, version
    POST /pierre_nugues/prog.sh HTTP/1.0
 2. Sequence of parameter names (46 types) followed by `:' and key-value pairs
    Accept: text/plain
    ...
    Host: cs.lth.se
    User-Agent: Mozilla/4.0
 3. Empty line: \r\n
 4. Data length should match the Content-Length parameter


#### Cookies
Cookies är en en liten bit information som som skickas från servern och sparas på klienten.
Klienten skickar tillbaka cookien vid efterförljande accesses för att:
 * Servern ska spara information om klienten
 * Spionera på klienten

När servern skickar en cookie så ser det ut: *Set-Cookie: fe_typo_user=4ca926632655c2ecb1a12c66eee5ad8f; path=/*

När klienten skickar tillbaka cookier ser det ut: *Cookie: fe_typo_user=4ca926632655c2ecb1a12c66eee5ad8f*

En cookies egenskaper:
 * domain
 * path
 * expires
 * connection type: http, secure

### URLConnections

En URLConnection representerar en länk mellan en URL och en applikation.

```
URL myDoc = new URL("http://cs.lth.se/");
InputStream is = myDoc.openStream();

===

URL myDoc = new URL("http://cs.lth.se/");
URLConnection uc = myDoc.openConnection();
InputStream is = uc.getInputStream();
```

En URLConnection möjliggör:
 1. Åtkomst till header fields
 2. Modifiera klientens egenskaper
 3. Använda mer detaljerade commands så som POST/PUT.

För att byta från GET till POST så används setDoOutput().

#### MIME
Multipurpose Mail Internet Extensions - är en tag för att identifiera innehållet, content type.

MIME definerar en kategori och ett format.
Användbara MIMEs är text/html, text/plain, image/gif, image/jpeg, application/pdf etc.

#### Caches

När en klient besöker en sida, så sparas bilder etc i klientens cacheminne, så att dessa inte behöver laddas ner igen för att förbättra performance.
Caches kontrolleras av HTTP headersen:
 * Expires (HTTP 1.0)
 * Cache-control (HTTP 1.1): max-age, no-store
 * Last-modifed
 * ETag: A unique identifer sent by the server. The identifer changes when the resource changes

#### REST

Representational State Transfer är en stilmodel för webben. 

RESTful arkitektur betyder implicit att 3 standarder används:
 1. HTTP:
    * Transfer protocol of the web
    * On top of TCP/IP
    * Pairs of requests from clients and responses from servers
 2. URI/URLs:
    * A way to name and address objects on the net
 3. HTML/XML

REST metoder, mappad med CRUD:
 * Create -> POST
 * Read -> GET
 * Update -> PUT
 * Delete -> DELETE

#### SESAME

SESAME extendar REST protokollet för att hantera grafer:
 1. GET hämtar statements från repo
 2. PUT uppdaterar data, skriver över. Förväntas innehålla supported RDF doc.
 3. DELETE raderar statements från repo.
 4. POST uppdaterar data, antingen med ett RDF doc, eller special purpose transaction document.

Föreläsning 5
-------------

Föreläsning 6
-------------

Föreläsning 7
-------------

Föreläsning 8
-------------

Föreläsning 9
-------------



Föreläsning 10
--------------

HTML är tyvvär rätt så statiskt, oftast vill man ha sidor som är dynamiska -
d.vs genererade utifrån något externt tillstånd exempelvis en databasfråga.

###CGI
Common Gateway Interface är ett sätt att generera dynamiska sidor med hjälp av godtyckligt skriptet.
1.  När webbservern får en begäran om en webbsida
    med en särskild URL startar servern ett externt
    program – ett “CGI-skript”.
2.  Det externa programmet läser in eventuella
    parametrar i form av en “query string” antingen
    via standard input eller s.k. “environmentvariabler”.
3.  Skriptet genererar en HTML-sida baserat på
    parametrarna och skriver HTML-koden till
    standard output.
4.  Programmet avslutas.

#### Fördelar
1. Du kan använda godtyckligt skriptspråk, du behöver pretty much bara ha tillgång till STD(IN/OUT) (och env-variabler)
2. "Väl beprövat", tydligen.
#### Nackdelar
1. Ineffektivt då det startar en helt ny OS process.
2. Måste avkoda query, post parametrar
3. Spara på disk för att spara på tillstånd (olika processer, remember?)

### Servlets
* Skrivna i Java.
* Systemoberoende.
* Skapar inte ny operativsystemsprocess varje gång. (Effektivare!)
* Startar inte om för varje HTTP-begäran. Kan komma ihåg information från gång till gång

### JSP (Java Server Pages)
Genererar en Servlet, funkar ungefär som servlets bara att servern måste generera en servlet sedan kompilera den (sker en gång!).
Varje JSP-fil innehåller implicita objekt som beskriver request (get, post, header, etc parametrar), response, session, application och out (som STDOUT i CGI).

###JSP vs Servlets
#### JSP
JSP, Java Servlet Pages, är templatad HTMLkod som genererar en Servlet.
Syntax mycket likt mustache där man blandar HTML och Javakod.
#### Servlets
Servlets (little server) är javakod som genererar HTMLsidor.

### PHP
* Open Source
* Liknar lite JSP
* Request parametrar hittas i typ `$_GET[<variabelnamn>]` och samma fast POST, och SESSION.
* Dynamiskt typat

### Javascript
* Påminner lite om java, inget mer gemensamt än namnet typ.
* Göra beräkningar på tal och strängar.
* Modifiera utseende och innehåll i ett webbläsarfönster.
* Skapa nya fönster och ladda in nya sidor.
* DOM manipulering.
Kan ej:
* Skicka TCP/UDP paket.
* Använda filsystemet.

### Ajax
Asynchronous JavaScript and XML
Samling av relaterade tekniker för interaktiv webb.
* Förbättrar svarstider genom att HTML-sidor
genereras lokalt mha JavaScript istället för på
servern. Endast små datamängder överförs.
* Data/skript överförs asynkront i bakgrunden.
* Bygger på JavaScript och (ofta, men inte alltid) XML
för överföring av data till/från servern.
* Sidans struktur kan manipuleras dynamiskt.
