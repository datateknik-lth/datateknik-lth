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
Ett URL kan skapas
