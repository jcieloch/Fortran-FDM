# Fortran-FDM
## Kompilator
gfortran

## Budowa programu
make all

## Wejście
Program wczytuje jedą liczbę całkowitą ze standardowego wejścia - rozmiar siatki

## Wyjście
Program wyświetla średni bład względny obliczeń, tworzone są dwa pliki: data.dat zawierający pary {wartość punktu siatki, wartość obliczona} oraz errors.dat zawierający {wartość punktu siatki, błąd względny obliczenia}

## Informacje
### Kind
Zmiana kind odbywa się przez zmianę parametru Kind w pliku matrix_operations.f90.
### Wykresy
Wszystkie wykresy znajdują się w pliku wykresy.pdf.
Zostały wygenerowane w programie Gnuplot.
