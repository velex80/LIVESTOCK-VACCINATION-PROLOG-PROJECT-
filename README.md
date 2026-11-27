==================================================
    GROUP MEMBERS :Velex Gicharu C026-01-0895/2025
                  :Arnold Kibet C026-01-0815/2024
                  : Cedric Odero C026-01-0985/2025
                  : Martha Gitau C026-01-0905/2025
                                     
================================================    



## 1. Community needs
| # | Problem | Why it matters |
|---|---------|----------------|
| 1 | Animal vaccination tracking | Paper cards get lost; farmers miss booster dates; outbreaks (FMD, anthrax, PPR, rabies) spread and animals cannot get movement permits |
## 2. Predicate calculus models

### Problem : Vaccination
**Predicates:** `Animal(a,s,o,age)`, `Requires(s,d,min,val)`, `Vaccinated(a,d,ago)`, `Eligible(a,d)`, `Protected(a,d)`, `Overdue(a,d)`, `Compliant(a)`, `Outbreak(d)`, `Quarantine(o)`

| Rule | First-order logic | Prolog |
|------|-------------------|--------|
| Eligible | ∀a,s,d,m,v,age. Animal(a,s,o,age) ∧ Requires(s,d,m,v) ∧ age ≥ m → Eligible(a,d) | `eligible/2` |
| Protected | ∀a,d,ago,v. Vaccinated(a,d,ago) ∧ Requires(s,d,m,v) ∧ ago < v → Protected(a,d) | `protected/2` |
| Overdue | ∀a,d. Eligible(a,d) ∧ ¬Protected(a,d) → Overdue(a,d) | `overdue/2` |
| Compliant | ∀a. (¬∃d. Overdue(a,d)) → Compliant(a) | `compliant/1` |
| Permit | ∀a. Compliant(a) → MovementPermit(a) | `movement_permit/1` |
| Quarantine | ∀o. (∃a,d. Outbreak(d) ∧ Animal(a,_,o,_) ∧ Overdue(a,d)) → Quarantine(o) | `quarantine/1` |
## 3. Technology integration (real-world delivery)
- **Vaccination:** vets or para-vets register animals; Prolog engine runs `reminder/3` and sends SMS/USSD (Africa's Talking) to farmers; `movement_permit/1` is checked at markets and checkpoints.

==================================
HOW WE USED AI IN THIS PROJECT
==================================
1.Building and testing: Generated starter code and scripts so as to test ideas faster.
2.Debugging and refactoring: It helped us Diagnose errors,explain unfamiliar logic and clean up our code
 

