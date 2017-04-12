#const period=2.
#const xmax=5.
#const ymax=5.
#const tick=0.
%For testing purpose we limit the time

%%%%%%%
%%%%%%%
tick(0..period).
xcoo(1..xmax).

ycoo(1..ymax).
next(I,I1) :- I1 = I+1, tick(I1), tick(I).

cell(f(X,Y)) :- xcoo(X), ycoo(Y).
%{ livecell(F) } :- cell(F).

cell(f((xmax+1)*T+X,Y)) :- xcoo(X), ycoo(Y), tick(T).

mark(f((xmax+1)+X,Y)) :- livecell(f(X,Y),1).


%livecell(F1,tick) :- cell(F1).
%deadcell(F1,tick) :- not livecell(F1,tick).
%livecell(f(3,2),0).
%livecell(f(3,3),0).
%livecell(f(3,4),0).

1 { livecell(F, 0) : cell(F) } 10.
deadcell(F,0) :- cell(F), not livecell(F,0).
%{deadcell(F,0)} :- cell(F), not livecell(F,0).


%yadjacent(f(X,Y),f(X,Y+1)) :- xcoo(X), ycoo(Y), ycoo(Y+1).
%xadjacent(f(X,Y),f(X+1,Y)) :- xcoo(X), ycoo(Y), xcoo(X+1).
%xdiagadjacent(f(X,Y),f)
%yadjacent(A,B) :- yadjacent(B,A).
%xadjacent(A,B) :- xadjacent(B,A).

%adjacent(A,B) :- xadjacent(A,B).
%adjacent(A,B) :- yadjacent(A,B).

adjacent(f(X,Y),f(X -1,Y)) :- cell(f (X ,Y)) ,cell(f(X -1 ,Y)).
adjacent(f(X,Y),f(X+1 ,Y)) :- cell( f (X ,Y) ),cell(f( X +1,Y )).
adjacent(f(X,Y),f(X ,Y -1)):- cell( f (X ,Y )),cell(f(X ,Y -1)).
adjacent(f(X,Y),f(X,Y+1))  :- cell(f (X ,Y)),cell(f(X,Y+1)).
adjacent(f(X,Y),f(X-1,Y-1)) :- cell(f(X,Y)),cell(f(X-1,Y-1)).
adjacent(f(X,Y),f(X+1,Y+1)) :- cell(f(X,Y)),cell(f(X+1,Y+1)).
adjacent(f(X,Y),f(X+1,Y-1)) :- cell(f(X,Y)),cell(f(X+1,Y-1)).
adjacent(f(X,Y),f(X-1,Y+1)) :- cell(f(X,Y)),cell(f(X-1,Y+1)).



livecell(F1,T2) :-  2 <= #count { F: adjacent(F,F1), livecell(F,T1), F != F1} <=3, livecell(F1,T1),next(T1,T2).
livecell(F2,T2) :- 3 = #count { F : adjacent(F,F2), livecell(F,T1), F != F2},deadcell(F2,T1), next(T1,T2).
deadcell(F3,T2) :- deadcell(F3,T1), not livecell(F3,T2),next(T1,T2).
deadcell(F4,T1):- cell(F4), not livecell(F4,T2), next(T1,T2).


%livecell(F1,2) :- livecell(F1,1), 2 <= #count { F: adjacent(F,F1), livecell(F,1), F != F1} <=3.
%livecell(F2,2) :- deadcell(F2,1), 3 = #count { F : adjacent(F,F2), livecell(F,1), F != F2}.
%deadcell(F3,2) :- deadcell(F3,1), not livecell(F3,2).
%deadcell(F4,2) :- cell(F4), not livecell(F4,2).

   
%live(f(X1,Y1)) :- livecell(f(X1,Y1),0), livecell(f(X2,Y2),period), X1=X2, Y1=Y2.

live(f(X,Y)) :- livecell(f(X,Y),0), livecell(f(X,Y),period).


%solved :- livecell(f(X,Y),2), live(f(X,Y)).

%solved :- livecell(F,2), live(F).
notsolved :- livecell(F,period), not live(F).
notsolved :- livecell(F,0), not live(F).
:- notsolved.
%osilator :- livecell(F1,0), livecell(F2,T), F1 = F2, T = period.

%T = T +1 :- T != period.

%:- T == period, livecell(F,T)

%livecell(F1 :-)

  
%#show live/2.
%#show livecell/2.

