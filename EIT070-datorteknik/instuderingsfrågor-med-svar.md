## Processorn

1. Vad  är  Moores  lag?
    
    Moores lag är observationen att antalet transistorer i en integrerad krets dubbleras ungefär vartannat år.

2. Vem  är  Von  Neumann?
    
    John von Neumann var en matematiker som bland annat beskrev den datorarkitektur som lade grunden till dagens moderna datorarkitekturer.

3. Vad  gör  en  kompilator?
    
    En kompilator översätter ett högnivå programspråk till ett annat med lägre nivå, ofta assembly eller direkt till maskinkod.

4. Vad  gör  en  assemblator?
    
    Assemblerar assemblerkod till maskinkod.

5. Ge  exempel  på  högnivåspråk?

    C och C++ är de vanligaste språken som kompilerar till assembler eller maskinkod medans Java är ett annat exampel som kompilerar till bytekod som sedan körs av en virtuell maskin (i detta fall JVM).

6. Vad  skiljer  ett  högnivåspråk  från  ett  maskinspråk?

    Datorn kan inte direkt läsa ett högnivåspråk utan det måste genomgå kompilation till maskinspråk (eller bytekod om det ska köras i t.ex. JVM) för att kunna exekveras.

7. Görs  alla  beräkningar  (+, -,  ...,  AND,  OR)  i  ALU:n?

    Nej, inte de som involverar flyttal.

8. Ge  exempel  på  indata  och  utdata  till  en  kontrollenhet
    
9. Ge  exempel  på  fördelar  med  att  använda  register  för  att  lagra  data
    
    Data i register tar mindre tid att hämta än data i t.ex. CPU cache, RAM-minne eller från disk. Det går även snabbare att spara till register.

10. Om  en  processor  gör  ”Fetch”  och  ”Execute”,  vad  görs  under  ”Fetch?  Vad  görs  under  ”Execute”?  Är  det  som  görs  under  ”Fetch”  samma  för  alla  instruktioner”
    
    

## Pipelining

1. Vad  är  pipelining?
    
    Pipelining är när processorn kör flera olika instruktioner samtidigt genom att tillåta en instruktion i varje fas (t.ex en i "Fetch" och en i "Execute").

2. Vilka  konflikter  kan  uppstå  i  en  pipeline?  
3. Illustrera  hur  konflikter  uppstår?  
4. Vad  kan  man  göra  för  att  undvika  konflikter?  
5. Vad  är  branchpredikion?  
6. Vad  är  spekulativ  exekvering?  
7. Delayed  branching  – vad  är  det?  Ge  ett  exempel.  
8. Ge  exempel  på  en  kompilatorteknik  som  kan  användas  för  att  unvika/hantera  konflikter i pipelinen.  

## Minne

1. Hur  lagras  information  på  en  hårddisk?

    En hårddisk (ej SSDs) lagrar information på magnetiska skivor som läses med ett läshuvud.

2. Vad  är  random  access  när  man  talar  om  minnen?

    Att alla sektorer på minnet tar lika lång tid att hämta.

3. Ge  exempel  på  minne  som  inte  har  random  access?

    I hårddiskar (ej SSDs) kan olika sektorer ta olika lång tid att hämta beroende på sektorns avstånd från läshuvudet tidigare position. 
    Därmed går det snabbare att läsa i sekvens på hårddiskar. 
    Defragmentering kan användas för att minimera avståndet mellan relaterade sektorer.

4. Vad  är  en  minneshierarki?

    En minneshierarki är 

5. Varför  uppstår  en  minneshierarki?  
6. Vad  kallas  principen  som  gör  att  cacheminne  fungerar?  Förklara  principen.  Ge  ett  exempel  på  programkod  där  cacheminne  INTE  ger  någon  vinst.  
7. Vad  är  en  cachemiss?  Varför  uppkommer  cachemissar?  Hur  hanteras  det?  
8. Cacheminnen  kan  ha  olika  mappningar – vilka?  Hur  fungerar  varje  mappning?  
9. I  direktmappning,  hur  ersätts  cacherader  vid  cachemissar?  
10. Vad  är  en  ersättningsalgoritm?  
11. Vad  menas  med  att  cacheminnet  inte  är  konsistent?  Hur  hålls  ett  cacheminne  konsistent?  
12. Antag  ett  program  som  exekverar  alla  instruktioner  i  en  sekvens  (en  i  taget)  och  att  det  finns  ett  cacheminne  för  instruktioner  där  cacherader  har  storlek  64bytes  och  varje  instruktion  kräver  2  bytes.  Vad  är  sannolikheten  för  att  nästa  instruktion  finns  i  samma cacherad  som  förra  instruktion?  
13. Vad  är  fördelen  med  paging?  
14. Vad  är  nackdelar  med  paging?  
15. Vad  är  fragmentering  när  vi  pratar  om  paging?  
16. Vad  är  skillnaden  på  extern  fragmentering  och  inter  fragmentering?  
17. Vad  är  paging?  
18. Vad  är  en  sida  (page),  ram  (frame)?  
19. Om  en  sida  är  2  kBytes,  kan  man  säga  något  om  storleken  på  primärminnet?  Kan  man  säga  något  om  storleken  av  en  ram?  
20. Vad  är  demand  paging?  
21. Vad  är  så  kallad   trashing?  När  uppkommer  det?  
22. Vad  är  skillnaden  på  paging  och  virtuellt  minne?  
23. Vad  är  sidfel?  
24. Vad  händer  vid  sidfel?  Hur  hanteras  det?  


## Operativsystem

1. Vad  gör  ett  operativsystem?

    Kärnan hanterar hårdvaruresurser, t.ex. arbetsminne, in/ut-enheter och processortid. Användarprogram 

2. Vad  är  multitasking?

    Att flera program körs samtidigt (eller iallafall att det uppfattas som att de gör det)

3. En  användare  känner  att  flera  program  exekverar  samtidigt,  hur  är  det möjligt?  

    Schemaläggaren tilldelar klockcykler på ett sådant sätt att användaren inte märker av att saker görs i en viss ordning och inte samtidigt.

4. Vad  är  ett  kontextbyte?

    Ett byte av vilken tråd som för stunden exekverar.

5. Hur  går  ett  kontextbyte  till?  Hur  vet  man  om  att  det  ska  ske?  Vem  är  inblandad?  

    Först har schemaläggaren beslutat om ett byte mellan två trådar. När detta byte sedan genomförs så sparas tillståndet (t.ex. register) undan för 
    den nuvarande tråden för att den nya tråden ska kunna ladda in det tillstånd som den nya tråden har undansparat sedan tidigare,
    detta är för att bevara trådar/processers tillstånd mellan byte av trådar.

6. Behövs  avbrott  för  att  klara  av  att  göra  kontextbyten?  
7. Hur  fungerar  avbrott?
8. Om  man  skapar  en  struktur  för  att  lagra  filer,  vad  vill  man  uppnå?  
9. Om  man  ska  läsa  in  en  fil  från  en  hårddisk,  vad  påverkar  lästiden?

-------
Källan för instuderingsfrågorna finns i `instuderingfrågor.pdf` som ursprungligen kommer [härifrån](http://www.eit.lth.se/fileadmin/eit/courses/eit070/2015/Instuderingsfr%E5gor.pdf).
