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

Om du skrivit ett dokument i t.ex. [Markdown][wp-markdown] eller LaTeX och
kompilerat till PDF så committa gärna in båda filerna. Det är viktigt att
källkoden finns för att andra ska kunna uppdatera och förbättra innehållet.
Samtidigt blir det enklare att läsa igenom det andra skrivit om det finns
färdigrenderade PDF:er så att man slipper ladda ner och kompilera själv.

[wp-markdown]: https://en.wikipedia.org/wiki/Markdown "Markdown - Wikipedia, the free encyclopedia"

Extentor är hårdvaluta eftersom de ibland försvinner från kurshemsidorna mellan
åren. De committas därför rakt in i repot. Det kan dock vara bekvämt att använda
repot för att hålla reda på mindre viktiga filer, som föreläsningsbilder. Dessa
blir snabbt både ointressanta och inaktuella och behöver därför inte finnas med
i historiken. De kan också ta upp stor plats. För att ändå kunna ha dem på samma
ställe som övriga resurser är [git-annex](#git-annex) en bra lösning.

Katalogstruktur
---------------

Strukturen är enligt följande

 ```
 /årskurs/kursnamn-kurskod/extentor
 /årskurs/kursnamn-kurskod/sammanfattningar
 /årskurs/kursnamn-kurskod/övrigt
 ```

Sökvägar bestående av endast gemener (små bokstäver) är alltså att föredra, då
de är lättare att skriva. Om det finns en vedertagen förkortning för kursnamnet
(endim, algodat, digsigmm, matstat, mm.) kan den med fördel användas istället
för att skriva ut hela namnet. Undvik t.ex. att skriva ut *"Ingenjörsprocessen
för programvaruutveckling -- ekonomi och kvalitet"*.

git-annex
---------

[git-annex][] gör det möjligt att spåra filer med git, utan att checka in deras
innehåll i git.

[git-annex]: https://git-annex.branchable.com/
