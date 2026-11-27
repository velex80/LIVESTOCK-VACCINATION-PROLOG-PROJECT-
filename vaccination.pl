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

% owner-level reasoning
at_risk_owner(O) :- animal(A, _, O, _), overdue(A, _).

% quarantine(O): owner has an unprotected animal against an active outbreak
quarantine(O) :- outbreak(D), animal(A, _, O, _), overdue(A, D).

% reminder(A,D,Msg): what the SMS/USSD system would send
reminder(A, D, Msg) :-
    overdue(A, D), animal(A, _, O, _),
    format(atom(Msg), 'Dear ~w: animal ~w is overdue for ~w vaccine.', [O, A, D]).

% overdue_count(Owner, N): number of distinct animals overdue
overdue_count(O, N) :-
    findall(A, (animal(A, _, O, _), overdue(A, _)), L),
    sort(L, S), length(S, N).

%% ---------- SAMPLE QUERIES ----------
% ?- overdue(A, D).
% ?- movement_permit(a6).
% ?- quarantine(O).
% ?- reminder(A, D, Msg).
% ?- overdue_count(mutua, N).