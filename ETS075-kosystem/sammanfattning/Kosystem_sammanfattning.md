Definitioner
============

**Kund eller Jobb:** Det som anländer till ett system. De
som ska betjänas.

**Ankomstintensitet:** Betecknas
$\lambda$ och är frekvensen som kunder kommer till systemet.

**Ankomstintensitet för en kund:** Betecknas $\beta$ och är
intensiteten som en kund kommer till systemet.

**Betjäningsintensitet:** Betecknas $\mu$ och är frekvensen
som kunder lämnar systemet.

**Erbjuden trafik:** Betecknas $\rho=\lambda/\mu$ och är
kvoten mellan frekvensen som kunder kommer till systemet och frekvensen
som kunder lämnar systemet.

**Avverkad trafik:** Är kvoten mellan frekvensen som kunder
kommer till systemet som inte spärras och frekvensen som kunder lämnar
systemet. Detta beräknas genom $\lambda_{eff}/\mu$

**Tidsspärr:** Betecknas $p_m$ och är sannolikheten att ett
system är fullt, dvs sannolikheten att vara i sista tillståndet.

**Anropsspärr:** Betecknas $r_m$ och är sannolikheten att
man anropar ett system som är fullt. Detta beräknas genom
$r_m={\lambda_mP_m}/\sum_{i=1}^{m}\lambda_iP_i$

**Lambdaeffektiv:** Betecknas $\lambda_{eff}$ och är
frekvensen som kunder kommer till ett system som inte är fullt.
$\lambda_{eff}=\lambda(1 - p_m)=\lambda_0p_0+\lambda_1p_1+\dots+\lambda_{m-1}p_{m-1}$

**Medelbetjäningstid:** Betecknas $\overline{x}=1/\mu$ och
är medeltiden att betjäna en kund.

**Medelväntetid:** Betecknas W och är medeltiden som en
kund få stå i kö, och är $W=T-\overline{x}$.
 
**Medelantalet kunder:** som finns i ett system betecknas
$E(N)$ eller $\overline{N}$ Detta kan beräknas med definitionen av
väntevärde eller genom Littles sats. Med definition räknar man
$E(N)=\sum_{i=1}^{k} kp_k$ där $p_k$ är sannolikheten för att vara i ett
visst tillstånd i systemet. Ibland vill man också beräkna medelantalet
kunder i betjänaren eller i kön. Då använder man att totala antalet
kunder/jobb i systemet är detsamma som summan av de i kön och de hos
betjänaren, dvs $\overline{N}=\overline{N_q}+\overline{N_s}$.
 
**Medeltid i systemet:** som finns i ett system betecknas
$T$. Medeltiden i systemet kan beräknas med följande samband:
$T=W+\overline{x} = W + 1/\mu = \overline{N}/\lambda_{eff}$

Satser
======

 **Littles sats:** Säger att medelantalet kunder i systemet
är lika med produkten mellan ankomstintensiteten för de som ej spärras
av ett system och medeltid i systemet. Dvs
$\overline{N}=\lambda{eff}\cdot T$. Detta ger också följande
formuleringar:

$\overline{N_s}=\lambda{eff}\cdot \overline{x}$ och
$\overline{N_q}=\lambda{eff}\cdot W$

Olika sorters system
====================

**M/M/1-system:**

**M/M/m-system:**

**M/M/1-upptagetsystem:**

**M/M/m-upptagetsystem:**

**M/G/1-system:**

**M/G/m-system:**

Rita tillståndsdiagram
======================

Ett tillståndsdiagram ska innehålla tre saker:
**Ankomstintensitet, betjäningsintensitet och tillstånd.**

**Ankomstintensitet:** Betecknas $\lambda$ eller $\beta$
och är frekvensen som kunder kommer till systemet. $\lambda$ används när
det är samma ankomstintensitet hela tiden för alla tillstånd. $\beta$
används när ankomstintensiteten beror på antalet kunder, dvs $\beta$ är
ankomstintensiteten som varje kund kan bidra med.

**Betjäningsintensitet:** Betecknas $\mu$ och är frekvensen
som kunder lämnar systemet.

**Tillstånd:** Det ska finnas tillstånd från noll kunder i
systemet upp till antalet köplatser och betjänare. Dvs 1 köplats och 1
betjänare innebär tre tillstånd. Ett för 0 kunder i systemet, ett för 1
kund i betjänaren och ett för 1 kund 1 betjänaren och 1 i kön. Dessa
tillstånd betecknas 0,1,2. Om man har mer än 1 betjänare måste man tänka
på att betjäningsintensiteten ökar. Dvs ifall det finns 2 betjänare så
kommer alla tillstånd som har två betjänare att ha dubbelt så hög
betjäningsintensitet än i tillstånden där man endast använder en
betjänare.

Beräkna tillståndssannolikheter
===============================

Tillståndssannolikheter är sannolikheten att befinna sig i ett visst
tillstånd i systemet. Det finns många sätt att räkna ut
tillståndssannolikheterna men den mest välanvända i denna kurs är
snittmetoden. Med snittmetoden kan man beräkna sannolikheten att vara i
alla olika tillstånd i tillståndsdiagrammet. Man föreställer sig ett
snitt mellan två tillstånd och skriver upp ekvationen som kommer av att
alla pilar genom snittet. Man brukar då först försöka skriva om alla
tillstånd så att alla sannolikheter är uttryckt i sannolikheten att vara
i tillstånd 0. Sedan utnyttjar man att $\sum_{i=0}^{k}p_k = 1$ och löser
ut $p_0$. Om vi byter ut $p_0$ i den vanliga uppgiften så har vi svaret.

Könät
=====

Ett könät består av flera kösystem(flera noder). Här kommer lite om
några beräkningar man kan göra på dessa könät:

1.  Skriv upp allt som anges i texten. Gör alltid detta! Och skilj på
    olika sorters kösystem!

2.  Beräkna ankomstintensiteter för varje nod.Utnyttja att det som
    kommer in i en nod är det som kommer ut ur en nod. Kommer det in
    olika intensiteter till en nod så summera de som kommer in.

3.  Beräkna erbjuden trafik för varje nod. Utnyttja att
    $\rho=\lambda/\mu$

4.  Beräkna medelantalet kunder för varje system. Detta görs med hjälp
    av littles sats($\overline{N} = \lambda_{eff}\cdot T$) eller om
    systemet är ett M/M/1 system(med oändlig kö) kan formeln
    $\rho/1-\rho$ användas.

5.  Beräkna medeltiden i systemet för varje nod. Här kan också littles
    sats användas $T =\overline{N}/\lambda_{eff}$. Om systemet är ett
    upptagetsystem(dvs inga köplatser, W=0) så är medeltiden i en nod
    lika med medelbetjäningstiden($T = W + \overline{x} = 0 + 1/\mu$).

6.  Beräkna medelantalet kunder som går igenom systemet eller en viss
    nod i systemet. Det totala medelantalet i systemet är summan av
    medelantalet vid varje
    nod($\overline{N_{tot}} = \overline{N_1} + \ldots + \overline{N_k} $).

7.  Beräkna medeltiden som går igenom hela systemet eller genom en viss
    nod i systemet. För att ta reda på medeltiden i hela systemet så
    måste man beräkna medeltiden för alla möjliga vägar och multiplicera
    detta med sannolikheten att ta just rätt väg. Dvs T = E(T)=E(T|Väg
    1)P(Väg 1)+E(T|Väg 2)P(Väg 2)+…+E(T|Väg k)P(Väg k).

8.  Undersök vilken nod som riskerar att bli instabil först.
    Stabilitetskravet säger att $\rho=\lambda/\mu\leq1$ för att vara
    stabilt. Uttryck därför alla stabiliteter med ett och samma
    $\lambda$ och kolla vad detta $\lambda$ blir då $\rho=1$. Jämför
    sedan vilket $\lambda$ som blir minst. Detta betyder att den klarar
    max av ankomstintensiteten $\lambda$ innan det blir instabilt.


