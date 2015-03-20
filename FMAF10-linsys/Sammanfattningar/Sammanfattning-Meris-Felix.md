Fråga 1
=======

#### Q:

Vad menas med en **odämpad harmonisk svängning**? Hur beräknas dess
komplexa amplitud?

#### A:

$Asin(\omega t + \phi)$ är en **odämpad harmonisk svängning**. Man
räknar ut den komplexa amplituden genom: $A(i\omega)=|H(i\omega)|$

Fråga 2
=======

#### Q:

Hur kan man definiera deltafunktionen?

#### A:

$\delta(t)=\lim_{\Delta \rightarrow 0}p_\Delta(t)$\
\
$\int_{-\infty}^{\infty} f(t)\delta(t)dt=f(0)$

Fråga 3
=======

#### Q:

Vilket samband finns mellan stegfunktionen och deltafunktionen?

#### A:

$\theta(t)' = \delta(t)$

Fråga 4
=======

#### Q:

Definiera Laplacetransform av en funktion. Har alla funktioner en
Laplacetransform? Om inte så förklara varför.

#### A:

$\mathcal{L} f(t) = \int_{-\infty}^{\infty} e^{-st}f(t)dt=F(s),\> s=\sigma + i \omega$\

Alla funktioner har inte en laplacetransform. Integralen måste
konvergera för att det ska finnas en sådan. T.ex:\
$f(t)=1, \mathcal{L}f(t) = \int_{-\infty}^{\infty} e^{-st}dt = [\frac{1}{s} e^{-st}]_{-\infty}^{+\infty} $

Fråga 5
=======

#### Q:

Härled derivationsregeln för den ensidiga Laplacetransformationen.

#### A:

Använd regel (19):\
$\mathcal{L}_I (f(t)) = F(s)$ så
$\mathcal{L}_I (f'(t)) =\mathcal{L}_I (f'(t) \theta (t)) = sF(s) - f(0)$\
Använd regel (16):\
$\mathcal{L}(f(t)) = s\mathcal{L}(f(t)) = (f(t)\theta(t))' = f'(t)\theta(t) + f(t)\delta(t) = f'(t)\theta(t) + f(0)\delta(t)$\
**VL:**
$\mathcal{L}((f(t)\theta(t))') = s\mathcal{L}(f(t)\theta(t)) = s\mathcal{L}(f(t)) $\
\
**HL:**
$\mathcal{L}(f'(t)\theta(t)) + \mathcal{L}(f(0)\delta(0)) = \mathcal{L}(f'(t)\theta(t)) +f(0)1 = \mathcal{L}_I(f'(\theta(t))) + f(0) = \mathcal{L}_I(f(t)) = s\mathcal{L}_I(f(t)) - f(0) $

Fråga 6
=======

#### Q:

Vad blir faltningarna $\delta * f$ och $\delta ^{(n)} * f$?

#### A:

$\delta ^{(n)} * f = f^{(n)}$ t.ex. $\delta ' * f = f'$ eftersom
$\mathcal{L}^{-1}(sF(s)) = f'(t)$ och $\mathcal{L}(\delta '(t)) = s$

Fråga 7 - viktig
================

#### Q:

Vad menas med att ett system i insignal- utsignalform är:

a)  Linjärt

b)  Tidsinvariant

c)  Stabilt

d)  Kausalt

#### A:

a)  Linjärt:
    $\mathcal{S}(aw_1 + bw_2) = a\mathcal{S}w_1 + b\mathcal{S}w_2$

b)  Tidsinvariant: Ifall $\mathcal{S}f(t)=y(t)$ så
    $\mathcal{S}f(t-\tau)=y(t-\tau)$

c)  Stabilt: Ifall insignalen är begränsad så är även utsignalen
    begränsad.

d)  Kausalt: Orsak föregår verkan. Insignalen $f(t)=0$ för $t<t_0$ så är
    utsignalen $y(t)=0$ för $t<t_0$

Fråga 8 - viktig
================

#### Q:

Under vilka villkor på impulssvaret är ett linjärt system i
insignal-utsignalform:

a)  Tidsinvariant - kommer ej

b)  Stabilt

c)  Kausalt

#### A:

a)  Tidsinvariant: kommer ej

b)  Stabilt: Om gränsvärdet $\int_{-\infty}^{\infty} |h(t)|dt$ är
    konvergent så är systemet stabilt.

c)  Kausalt: Ifall $h(t)$ är en kausal funktion. T.ex. ifall $h(t)$
    innehåller $\theta(t)$ så är $h(t)=0$ för $t<0$

Fråga 9
=======

#### Q:

System i insignal-utsignalform kan ibland beskrivas som faltningar med
en fix funktion. Under vilka villkor på systemet gäller detta och vad
kallas den fixa funktionen?

#### A:

Detta gäller för LTI-system (Linjärt tidsinvarianta) där $h(t)$ är
impulssvaret och utsignalen $y(t)=f(t)*h(t)$

Fråga 10
========

#### Q:

Vilka samband finns mellan stegsvar och impulssvar för ett linjärt
tidsinvariant system?

#### A:

Derivatan av stegsvaret är impulssvaret. Detta ges som:
$(\mathcal{S}\theta(t))' = h(t)$

Fråga 11
========

#### Q:

Ange impulssvaret för en derivation och en fördröjning.

#### A:

Då impulssvaret är $\delta(t)$ så är dess derivata
$\frac{d}{dt}\delta(t)=\delta'(t)$ och en fördröjning för $\delta(t)$ är
$\delta(t-a)$.

Fråga 12
========

#### Q:

Definiera överföringsfunktionen för ett LTI-system.

#### A:

Överföringsfunktionen är laplacetransformen av impulssvaret\
$\mathcal{L}(h(t)) = H(s)$ eller $\frac{\mathcal{S}e^{st}}{e^{st}}$

#### Exempel:

Utsignal kan beräknas med hjälp av frekvensfunktionen
$F_n(\omega)=H(s)$, se fråga 14.

Fråga 13
========

#### Q:

Vilka villkor måste man lägga på ett system för att det skall ha en
frekvensfunktion? Ange sambandet mellan frekvens- och
överföringsfunktionen.

#### A:

För ett stabilt system så: $F_n(\omega) = H(i\omega)$

Fråga 14
========

#### Q:

Hur kan ett systems svar på en sinusfunktion bestämmas, då
frekvensfunktionen för systemet är känd?

#### A:

$A(\omega)=|F_n(\omega)|$, $\phi(\omega)=arg(F_n(\omega))$ och
$\mathcal{S}sin(\omega t) = A(\omega)sin(\omega t + \phi(\omega))$\
**Exempel:** Vad är svaret på sin2t?\
$F_n(\omega) = \frac{1}{i\omega + 1} \Leftrightarrow H(s)=\frac{1}{s+1}$\
Överför sinusfunktionen på exponentform: $sin(2t) = Im(e^{2it})$ detta
ger att $Im(\mathcal{S}e^{2it}=H(2i)=\frac{1}{2i+1}(cos(2t)+isin(2t))$

Fråga 15
========

#### Q:

Ange sambandet mellan överföringsfunktionen och impulssvaret för ett
LTI-system.

#### A:

$\mathcal{L}(h(t)) = H(s)$

Fråga 16
========

#### Q:

Ge ett exempel på en kvadratisk matris som inte är diagonaliserbar (med
bevis att den inte är det).

#### A:

**Exempel:** <span> $A=
\begin{bmatrix}
0 & 1 \\
0 & 0
\end{bmatrix}
$ </span>

**Bevis:** $\lambda_1=\lambda_2=0$ Om $A$ är diagonaliserbar så är
$\mathcal{S}^{-1}A\mathcal{S} = 
\begin{bmatrix}
\lambda_1 && 0 \\
0 && \lambda_2
\end{bmatrix}
\Rightarrow
A=\mathcal{S}0\mathcal{S}^{-1}=0$ : det sista stämmer ej.

Fråga 17
========

#### Q:

Finns det en diagonaliserbar matris med multipla egenvärden? Ge i så
fall ett exempel (med bevis).

#### A:

Ja, till exempel $\begin{bmatrix} 1 && 0 \\ 0 && 1 \end{bmatrix}$ som
redan är diagonal. ($\lambda_1=\lambda_2=1$)

Fråga 18
========

#### Q:

Ange sambanden mellan spår, determinant och egenvärden för en matris.

#### A:

$tr(A)=\lambda_1 + \ldots + \lambda_n$\
$det(A)=\lambda_1 \cdot \ldots \cdot \lambda_n$

Fråga 19
========

#### Q:

Kommer ej på tentamen, tack Victor.

Fråga 20
========

#### Q:

Definiera matrisexponentialfunktionen $e^{At}$ för en godtycklig
kvadratisk matris.

#### A:

$e^{At} = I + At + \frac{A^2t^2}{2} +  \frac{A^3t^3}{3!} + \ldots$

Fråga 21
========

#### Q:

Vilken typ av termer uppträder i exponentialmatrisen $e^{tA}$? Hur kan
man här se skillnad på diagonaliserbara och icke-diagonaliserbara
matriser?

#### A:

Exponentialmatrisen $e^{At}$ innehåller $C_ie^{\lambda_it}$-termer i det
fall att A är diagonaliserbar. Ifall matrisen är icke-diagonaliserbar så
förekommer $C_it^ke^{\lambda_it}$-termer.

Fråga 22
========

#### Q:

Definiera begreppet ortogonal matris.

#### A:

$A^T=A^{-1}$

Fråga 23
========

#### Q:

Formulera spektralsatsen för (reella) symmetriska matriser.

#### A:

Om A är en reell symmetrisk matris så är A diagonaliserbar med hjälp av
en ortogonal matris $\mathcal{S}$.\
<span>
$\mathcal{S}^{-1}A\mathcal{S}=\begin{bmatrix} \lambda_1 && && \\ && \ddots && \\ && && \lambda_n \end{bmatrix} = \mathcal{S}^TA\mathcal{S}$
</span> alla $\lambda_i$ är reella.

Fråga 24
========

#### Q:

Definiera begreppet kvadratisk form och ange hur en sådan brukar
beskrivas i matrisform.

#### A:

$f(\mathcal{X})=\sum\limits_{i,j=1}^{n} a_{ij}x_ix_j$

Fråga 25
========

#### Q:

Hur transformeras matrisen för en kvadratisk form vid ett linjärt
koordinatbyte? Vilken är skillnaden mellan denna transformationsformel
och motsvarande vid linjära avbildningar?

#### A:

Matrisen för linjärt koordinatbyte är en
**likformighetstransformation**\
<span>$\hat{A} = S^{-1}AS$, </span> medan matrisen för en kvadratisk
form transformeras genom en **kongruenstransformation**
<span>$\hat{K} = K^{-1}AS$. </span>

Fråga 26
========

#### Q:

Ett LTI system av ändlig ordning är kausalt. Hur kan man med hjälp av
dess överföringsfunktion avgöra om det är stabilt?

#### A:

Givet en godtycklig överföringsfunktion <span>
$ H(s) = \frac{P(s)}{Q(s)} $ där P,Q är godtyckliga polynom. </span> Då
är ssystemet $\mathcal{S}$ stabilt om överföringsfunktionen uppfyller
följande krav:

1)  $deg(P(s)) \leq deg(Q(s))$

2)  För alla lösningar, $s_i$, av $Q(s) = 0$ så är $Re(s) < 0$

Satser och tips och trix
========================

-   $D=S^{-1}AS \Leftrightarrow A=SDS^{-1}$

-   $A^n=SD^{n}S^{-1}$

-   $f(t)\delta(t-a)=f(a)\delta(t-a)$

-   Frekvensfunktion: $H(i\omega)$

-   Amplitudfunktion: $A(\omega)=|H(i\omega)|$

-   Fasfunktion: $\phi(\omega)=arg(H(i\omega))$

-   $H(i\omega)=A(\omega)e^{i\phi(\omega)}$

-   Egenvärdena till en diagonalmatris är egenvärdena.

-   $e^{At}=Se^{Dt}S^{-1}$, vilket betyder att ifall man diagonaliserar
    matrisen $A$ och tar fram $S$ så kan man få fram exponentialmatrisen
    enkelt genom denna sats.

-   $|t|=2t\theta(t)-t$

-   ${\int}f(t)\theta(t-a)dt=[F(t)-F(a)]\theta(t-a)$

-   Om något $\lambda_i=0$ för matrisen $A$ så är $det(A)=0\Rightarrow$
    ej inverterbar

-   Om något $\lambda_i=0$ för matrisen $A$ så är matrisen ej ortogonal
    eftersom denna inte är inverterbar.

-   När en matris determinant är positiv så är matrisen stabil.

-   $B(t)=e^{At}$, $B(2)^2=e^{2A2}$

-   Istället för att kvadratkomplettera den kvadratiska formen kan man
    gaussa matrisen $K$ så att denna har 1:or diagonalt. $d_i$ blir då
    det man delar respektive rad med för att få en etta på diagonalen.

-   Alla $d_i>0$: positivt definit matris

-   Alla $d_i<0$: negativt definit matris

-   Alla $d_i\geq0$: positivt semidefinit matris

-   Alla $d_i\leq0$: negativt semidefinit matris

-   Matrisen har både $d_i<0$ och $d_i>0$: indefinit matris

-   $e^0 = I$

-   För att lösa begynnelsevärdesproblemet:
    $X'=AX, X(0)=\begin{bmatrix} 1 \\ 1 \\ 2 \end{bmatrix}$ kan man
    använda $X(t)=e^{At}X(0)$ för att enkelt lösa problemet.

-   En matris är diagonaliserbar ifall alla egenvärden är unika.

-   En matris är inverterbar då $det(A)\ne0$

-   En matris är symmetrisk då den **inte** innehåller imaginära
    egenvärden.

-   Om $tr(A)<0$ så måste minst ett av egenvärdena vara mindre än noll.

-   $u=Sv$, $\frac{du}{dt}=Au$

-   $f(x_1,x_2)=x_1^2+2x_2^2$: positivt definit

-   $f(x_1,x_2,x_3)=x_1^2+2x_2^2$: positivt semidefinit

-   

Exempeluppgifter
================

Hur många egenvärden \< 2?
--------------------------

$A=\begin{bmatrix}1&&2&&3\\2&&3&&4\\3&&4&&5\end{bmatrix}$\
För att lösa detta gör vi följande: $(A-2I)=B$\
Om $AX=\lambda B$ så $BX=(A-2I)X=\lambda X-2X=(\lambda-2)X$. Gaussning
med denna nya matris ger samma egenvektorer men $\lambda_i-2$ som
egenvärde. Eftersom $\lambda_i-2<0 \Leftrightarrow \lambda_i<2$ så
följer: $B=A-2I=\begin{bmatrix}-1&&2&&3\\2&&1&&4\\3&&4&&3\end{bmatrix}$
gaussning av denna matris ger ut: $d_1=-1$,$d_2=5$,$d_3=-8$. De
egenvärden som \< 0 är de vi söker. $d_1$ och $d_3$ uppfyller detta.
Alltså har vi två egenvärden som är mindre än noll.
