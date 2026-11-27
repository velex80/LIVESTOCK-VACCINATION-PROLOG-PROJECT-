%% ============================================================
%%  PROBLEM 1: ANIMAL VACCINATION TRACKING
%%  Knowledge base + rules (First-Order Logic -> Prolog)
%% ============================================================

:- discontiguous animal/4, vaccinated/3.

%% ---------- FACTS ----------
% animal(ID, Species, Owner, AgeInMonths)
animal(a1, cow,     wanjiku, 24).
animal(a2, goat,    mutua,    8).
animal(a3, dog,     kamau,   14).
animal(a4, cow,     mutua,    5).
animal(a5, chicken, achieng,  5).
animal(a6, goat,    wanjiku, 30).   