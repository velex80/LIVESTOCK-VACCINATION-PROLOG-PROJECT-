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


% requires(Species, Disease, MinAgeMonths, ValidityMonths)
requires(cow,     foot_and_mouth, 4,  6).
requires(cow,     anthrax,        6, 12).
requires(goat,    ppr,            3, 12).
requires(goat,    anthrax,        6, 12).
requires(dog,     rabies,         3, 12).
requires(chicken, newcastle,      1,  3).

% vaccinated(Animal, Disease, MonthsAgo)
vaccinated(a1, foot_and_mouth, 3).
vaccinated(a1, anthrax,       14).
vaccinated(a2, ppr,            2).
vaccinated(a3, rabies,         5).
vaccinated(a5, newcastle,      4).
vaccinated(a6, ppr,            1).
vaccinated(a6, anthrax,        2).

% outbreak(Disease): currently reported in the area
outbreak(foot_and_mouth).

%% ---------- RULES ----------
% eligible(A,D): animal is old enough for vaccine D
eligible(A, D) :-
    animal(A, S, _, Age), requires(S, D, Min, _), Age >= Min.

% protected(A,D): has a vaccination that has not expired
protected(A, D) :-
    animal(A, S, _, _), requires(S, D, _, Validity),
    vaccinated(A, D, Ago), Ago < Validity.

% overdue(A,D): eligible but not protected
overdue(A, D) :- eligible(A, D), \+ protected(A, D).

% compliant(A): no overdue vaccinations -> may get a movement permit
compliant(A)         :- animal(A, _, _, _), \+ overdue(A, _).
movement_permit(A)   :- compliant(A).