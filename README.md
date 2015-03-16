Välkommen
=========

Detta är ett inofficiellt repo med resurser för studenter på
civilingenjörsprogrammet datateknik vid LTH. Här finns extentor,
sammanfattningar, lösningar av övningsuppgifter, svar på instuderingsfrågor och
liknande. Allt som kan tänkas hjälpa till med studierna är välkommet. Det som
inte är välkommet är sådant som kan betraktas som fusk, exempelvis svar på
labbförberedelser och inlämningsuppgifter.

Regler
------

 1. Inget fusk får finnas i repot.
 2. Ifall man bidrar till en sammanfattning så kan man lägga till sitt namn i
    title eller dylikt om man vill.
 3. Alla textfiler ska vara i teckenkodade i UTF-8. Detta är standard i alla
    moderna Linuxdistributioner. Använder man Windows eller Mac OS X kan man
    behöva ställa in sin texteditor till att använda UTF-8.

Innehåll
--------

Tidigare har repot tagit emot både [Markdown][wp-markdown] eller LaTeX med
tillhörande pdf. Framöver så vill vi endast ta emot Markdown. Således kommer
alla pull requests med LaTeX att ignoreras. För att lösa problemet med formler
i Markdown använd gärna en tjänst som [iTex2Img](http://www.sciweavers.org/free-online-latex-equation-editor).
Spara bilderna direkt i repot och länka via Markdown. Vi går över till markdown
för att göra innehåller lättare att läsa utan att behöva ladda ner det stora
repot.

[wp-markdown]: https://en.wikipedia.org/wiki/Markdown "Markdown - Wikipedia, the free encyclopedia"

Extentor är hårdvaluta eftersom de ibland försvinner från kurshemsidorna mellan
åren. De committas därför rakt in i repot. Det kan dock vara bekvämt att använda
repot för att hålla reda på mindre viktiga filer, som föreläsningsbilder. Dessa
blir snabbt både ointressanta och inaktuella och behöver därför inte finnas med
i historiken. De kan också ta upp stor plats. För att ändå kunna ha dem på samma
ställe som övriga resurser är [git-annex](#user-content-git-annex) en bra
lösning. Se [ETSF01-ingproc3/lectures](ETSF01-ingproc3/lectures) för ett
exempel.

Katalogstruktur
---------------

Strukturen är enligt följande

    /KURSKOD-kursnamn/extentor
    /KURSKOD-kursnamn/sammanfattningar

Sökvägar bestående av endast gemener (små bokstäver) är alltså att föredra, då
de är lättare att skriva. Undantaget är kurskoden som skrivs med versaler av
historiska skäl. Om det finns en vedertagen förkortning för kursnamnet (endim,
algodat, digsigmm, matstat, mm.) kan den med fördel användas istället för att
skriva ut hela namnet. Undvik t.ex. att skriva ut *"Ingenjörsprocessen för
programvaruutveckling -- ekonomi och kvalitet"*. Svenska och engelska blandas
friskt tills konsensus att använda det ena eller det andra språket uppnåtts.

git-annex
---------

[git-annex][] gör det möjligt att spåra filer med git, utan att checka in deras
innehåll i git. Namnet på filen, vilken katalog den ligger i, dess storlek och
checksumma lagras i form av en [symbolisk länk][wp-symlink] som pekar in i
repots `.git`-katalog. Information om var filens innehåll finns tillgänglig
lagras i en separat branch `git-annex`. Den kan exempelvis finnas på en webb-
eller SSH-server, i en Google Drive eller på en extern hårddisk. Metadatan
lagras alltså här, på Github, medan datan lagras någon annanstans.

Filen kan när som helst hämtas med kommandot `git annex get <filnamn>`. När den
inte längre behövs kan den raderas med `git annex drop <filnamn>`. git-annex
kontrollerar då att den fortfarande är tillgänglig någon annanstans så att den
kan hämtas igen senare.

[git-annex]: https://git-annex.branchable.com/
[wp-symlink]: https://en.wikipedia.org/wiki/Symbolic_link "Symbolic link - Wikipedia, the free encyclopedia"

### Installation

git-annex är skrivet i Haskell. För den som inte tycker att det är ett nöje i
sig att kompilera Haskell rekommenderas att använda en färdigbyggd binär. På
[git-annex webbplats][git-annex] finns binärer för Linux, Windows och Mac OS X.
För Debian och Ubuntu finns git-annex i förråden och kan installeras med
`apt-get install git-annex`. För Arch Linux rekommenderas paketet
[git-annex-bin från AUR][aur-git-annex-bin].

[aur-git-annex-bin]: https://aur.archlinux.org/packages/git-annex-bin/ "AUR (en) - git-annex-bin"
