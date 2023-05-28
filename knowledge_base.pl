mianbiwi('choteKhan', 'chotiRani').
mianbiwi('barreKhan', 'barriRani').
mianbiwi('salim', 'kausar').
mianbiwi('nadir', 'nahid').
mianbiwi('asad', 'sumra').
mianbiwi('rizwan', 'sanam').

parent('choteKhan', 'kausar').
parent('chotiRani', 'kausar').
parent('choteKhan', 'nadir').
parent('chotiRani', 'nadir').
parent('choteKhan', 'asad').
parent('chotiRani', 'asad').

parent('barreKhan', 'nahid').
parent('barriRani', 'nahid').
parent('barreKhan', 'sumra').
parent('barriRani', 'sumra').

parent('salim', 'rizwan').
parent('kausar', 'rizwan').

parent('nadir', 'burhan').
parent('nahid', 'burhan').
parent('nadir', 'rashid').
parent('nahid', 'rashid').
parent('nadir', 'akram').
parent('nahid', 'akram').

parent('asad', 'salima').
parent('sumra', 'salima').
parent('asad', 'sanam').
parent('sumra', 'sanam').

parent('rizwan', 'rabia').
parent('sanam', 'rabia').

gins('male', 'choteKhan').
gins('male', 'barreKhan').
gins('male', 'salim').
gins('male', 'nadir').
gins('male', 'asad').
gins('male', 'rizwan').
gins('male', 'burhan').
gins('male', 'rashid').
gins('male', 'akram').

gins('female', 'chotiRani').
gins('female', 'barriRani').
gins('female', 'kausar').
gins('female', 'nahid').
gins('female', 'sumra').
gins('female', 'salima').
gins('female', 'sanam').
gins('female', 'rabia').

baap(Baap, Bacha):-
    parent(Baap, Bacha),
    gins('male', Baap).

maan(Maan, Bacha):-
    parent(Maan, Bacha),
    gins('female', Maan).

beti(Beti, Parent):-
    parent(Parent, Beti),
    gins('female', Beti).

beta(Beta, Parent):-
    parent(Parent, Beta),
    gins('male', Beta).

dada(Dada, PotaPoti):-
    baap(Dada, Abbu), baap(Abbu, PotaPoti).

nana(Nana, NawasaNawasi):-
    maan(Maan, NawasaNawasi), baap(Nana, Maan).

dadi(Dadi, PotaPoti):-
    baap(Abbu, PotaPoti), maan(Dadi, Abbu).

nani(Nani, NawasaNawasi):-
    maan(Maan, NawasaNawasi), maan(Nani, Maan).

bahu(Bahu, SaasSussar):-
    beta(Beta, SaasSussar), mianbiwi(Beta, Bahu).

pota(Pota, DadaDadi):-
    beta(Abbu, DadaDadi), beta(Pota, Abbu).

nawasa(Nawasa, NanaNani):-
    beti(Maan, NanaNani), beta(Nawasa, Maan).

bhai(Bhai, BehnBhai):-
     baap(Baap, BehnBhai), beta(Bhai, Baap), Bhai \= BehnBhai.

behn(Behn, BehnBhai):-
    baap(Baap, BehnBhai), beti(Behn, Baap), Behn \= BehnBhai.

chachataya(Chacha, Banda):-
    baap(Abbu, Banda), bhai(Chacha, Abbu).

khala(Khala, BhanjaBhanji):-
    maan(Maan, BhanjaBhanji), behn(Khala, Maan).

sussar(Sussar, Bahu):-
    gins('female', Bahu), baap(Sussar, Shohar), mianbiwi(Shohar, Bahu).

sussar(Sussar, Damad):-
    gins('male', Damad), baap(Sussar, Biwi), mianbiwi(Damad, Biwi).

sala(Sala, Banda):-
    bhai(Sala, Begum), mianbiwi(Banda, Begum).

baapDada(BaapDada, Bacha):-
    baap(BaapDada, Bacha), dada(BaapDada, Bacha).

aulaad(Aulaad, Waliden):-
    parent(Waliden, Aulaad).

siblings(Siblings, Banda):-
    maan(X, Banda), maan(X, Siblings), Banda \= Siblings.


count(0,[]).
count(Sum, [_|T]):-
    count(TailCount, T),
    Sum is TailCount + 1.

countaulaad(Kitny, Waliden):-
    bagof(Bachy, (aulaad(Bachy, Waliden)), Bachy),
    count(Kitny, Bachy).

countsiblings(Kitny, Bacha):-
    bagof(Siblings, (siblings(Siblings, Bacha)), Siblings),
    count(Kitny, Siblings).

countbehn(Kitni, Banda):-
    bagof(Behn, (behn(Behn, Banda)), Behn),
    count(Kitni, Behn).

countbhai(Kitny, Banda):-
    bagof(Bhai, (bhai(Bhai, Banda)), Bhai),
    count(Kitny, Bhai).

countchachataya(Kitny, Banda):-
    bagof(Chacha, (chachataya(Chacha, Banda)), Chacha),
    count(Kitny, Chacha).

countkhala(Kitni, Banda):-
    bagof(Khala, (khala(Khala, Banda)), Khala),
    count(Kitni, Khala).

countsala(Kitny, Banda):-
    bagof(Sala, (sala(Sala, Banda)), Sala),
    count(Kitny, Sala).

countbeti(Kitni, Banda):-
    bagof(Beti, (beti(Beti, Banda)), Beti),
    count(Kitni, Beti).

countbeta(Kitny, Banda):-
    bagof(Beta, (beta(Beta, Banda)), Beta),
    count(Kitny, Beta).

countparent(Kitny, Banda):-
    bagof(Parent, (parent(Parent, Banda)), Parent),
    count(Kitny, Parent).

countmianbiwi(Kitny, Banda):-
    gins('female', Banda), bagof(Mian, (mianbiwi(Mian, Banda)), Mian),
    count(Kitny, Mian).

countmianbiwi(Kitny, Banda):-
    gins('male', Banda), bagof(Biwi, (mianbiwi(Banda, Biwi)), Biwi),
    count(Kitny, Biwi).

countmianbiwi(Kitny, Banda):-
    gins('female', Banda), bagof(Mian, (mianbiwi(Mian, Banda)), Mian),
    count(Kitny, Mian).

countfamily(Count, Banda):-
    countmianbiwi(Kitny, Banda),
    countaulaad(Aulaad, Banda),
    countsiblings(Siblings, Banda),
    countparent(Parent, Banda),
    Count is 1 + Parent + Siblings + Aulaad + Kitny.


