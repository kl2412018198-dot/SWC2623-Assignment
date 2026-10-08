% Learner facts
learner(101, ali).
learner(102, siti).
learner(103, ahmad).
learner(104, aina).
learner(105, john).

% Module facts
module(programming).
module(database).
module(web_development).
module(software_engineering).
module(artificial_intelligence).
module(cybersecurity).

% Completed modules
completed(101, programming).
completed(101, database).

completed(102, programming).

completed(103, programming).

completed(104, programming).
completed(104, database).
completed(104, web_development).
completed(104, software_engineering).
completed(104, artificial_intelligence).
completed(104, cybersecurity).

completed(105, programming).

% Prerequisite facts
prerequisite(database, programming).
prerequisite(web_development, programming).
prerequisite(software_engineering, programming).
prerequisite(artificial_intelligence, programming).
prerequisite(artificial_intelligence, database).
prerequisite(cybersecurity, programming).

% Programme-required modules
required_module(programming).
required_module(database).
required_module(web_development).
required_module(software_engineering).
required_module(artificial_intelligence).
required_module(cybersecurity).

% Eligibility rule
eligible(LearnerID, Module) :-
    module(Module),
    forall(prerequisite(Module, Prerequisite),
           completed(LearnerID, Prerequisite)).

% Recommendation rule
recommend_module(LearnerID, Module) :-
    module(Module),
    eligible(LearnerID, Module),
    \+ completed(LearnerID, Module).

% Certification rule
eligible_for_certification(LearnerID) :-
    learner(LearnerID, _),
    forall(required_module(Module),
           completed(LearnerID, Module)).
