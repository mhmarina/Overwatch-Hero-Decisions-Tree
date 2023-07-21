% Name: Marina Nasralla
% Date: 7/19/2023
% Title: Overwatch Hero finder
% Desc: Overwatch is a first person hero based shooter
%       with a diverse cast of characters.
%       Type “hero_finder.” to begin.

hero_finder :-
  intro,
  write( 'Answer all questions y for yes or n for no.'),nl,
  clear_stored_answers,
  try_all_possibilities.

try_all_possibilities :-  % backtrack through all
  may_be(D),		  % possibilities
  explain(D),
  fail.

try_all_possibilities.	  % then succeed with no further action.

% case knowledge base - user responses

:- dynamic(stored_answer/2).

% procedure to get rid of previous responses
% without abolishing the dynamic declaration

clear_stored_answers :- retract(stored_answer(_,_)),fail.
clear_stored_answers.

% procedure to ask the user a question and recieve an
%  answer, or retrieve the result if already asked

user_says(Q,A) :- stored_answer(Q,A).

user_says(Q,A) :-
  \+ stored_answer(Q,_),
  nl,nl,
  ask_question(Q),
  get_yes_or_no(Response),
  asserta(stored_answer(Q,Response)),
  Response = A.

% Prompt that obtains a yes or no answer

get_yes_or_no( Result ) :-
  get(Char),	% read a single character
  get0(_),      % consume the return after it
  interpret(Char,Result),
  !.            % cut - only one result.

get_yes_or_no( Result ) :-
  nl,
  write('Type y or n'),
  get_yes_or_no( Result ).

interpret(89,yes).	% ASCII 89 = 'Y'
interpret(121,yes).	% ASCII 121 = 'y'
interpret(78,no).	% ASCII 78 = 'N'
interpret(110,no).	% ASCII 110 = 'n'

% Simple scooby-doo expert system - customized additions.

intro :-
  write( 'This program identifies a hero on ' ),nl,
  write( 'the hit game Overwatch(2)."'),nl.

% possibilities

may_be( wrecking_ball ) :-
  user_says(human,no),
  user_says(ape,no).

may_be( winston ) :-
  user_says(human,no),  
  user_says(ape,yes).

may_be( mercy ) :-
  user_says(human,yes),
  user_says(male,no),
  user_says(fly,yes),
  user_says(healer,yes).
  
may_be( pharah ) :-
  user_says(human,yes),
  user_says(male,no),
  user_says(fly,yes),
  user_says(healer,no).

may_be( sombra ) :-
  user_says(human,yes),
  user_says(male,no),
  user_says(fly,no).

may_be( reaper ) :-
  user_says(human,yes),
  user_says(male,yes),
  user_says(healer,no).

may_be( lucio ) :-
  user_says(human,yes),
  user_says(male,yes),
  user_says(healer,yes).

% Text of the questions

ask_question(human) :-  write('Is the hero a human? '),nl.

ask_question(ape) :-  write('Is the hero an ape? '), nl.

ask_question(male) :-
  write('Is the hero male? '), nl.

ask_question(fly) :-
  write('Can the hero fly? '), nl.

ask_question(healer) :-
  write('Is the hero a healer? '),nl.

% Explanations for the various diagnoses

explain(wrecking_ball) :- nl,
	write('As a ball, Wrecking Ball\'s default speed '), nl,
  write('is much faster than other heroes.'),nl.

explain(winston) :-  nl,
  write('Winston is a scientist and fighter who '), nl,
  write('possesses the strength and intellect to '), nl,
  write('venture beyond the limit of humanity.'),nl.

explain(mercy) :-  nl,
  write('Mercy is able to stay close to her team '),nl,
  write('thanks to the valkyrie suit she invented '), nl.

explain(pharah) :-  nl,
  write('Pharah was originally named "Rocket Dude"'),nl.

explain(sombra) :-  nl,
  write('Sombra is a hacker who has hidden within ') ,nl,
  write('the shadows to find a global conspiracy '), nl,
  write('that she once encountered.'),nl.

explain(reaper) :- nl,
  write('Reaper is one of the few heros in the game '), nl,
  write('to actively and continually pursue violence '), nl.

explain(lucio) :- nl,
  write('Lucio heals people with his music. '), nl.
