


:- dynamic sudoku_puzzle_state/3.
:- dynamic is_puzzle_constraint/2.
:- dynamic level/1.
:- dynamic xtry/1.

% :- dynamic false_row_trace/2.
% :- dynamic current_row/1.
% :- dynamic row_trace/2.
% :- dynamic field_trace/3.

:- dynamic cell_candidates/3.
:- dynamic solution_is_violated/0.
:- dynamic false_candidate/4.
:- dynamic trace_remove/3.

:- dynamic trace_field_assigned/3.
:- dynamic trace_field_assigned_reverse/3.
:- dynamic violated_field/2.
:- dynamic last_row/1.





% facts,   row column, quadrant
sudoku_board( 1, 1 , 1 , 1).  sudoku_board( 1, 2 , 1 ,2 ).   sudoku_board( 1, 3 , 1 , 3).
sudoku_board( 1, 4 , 2 , 1 ).  sudoku_board( 1, 5 , 2, 2 ).   sudoku_board( 1, 6 , 2, 3 ).
sudoku_board( 1, 7 , 3 , 1  ).  sudoku_board( 1, 8 , 3, 2 ).   sudoku_board( 1, 9 , 3, 3 ).

sudoku_board( 2, 1 , 1 , 4).  sudoku_board( 2, 2 , 1 ,5).  sudoku_board( 2, 3 , 1 ,6).
sudoku_board( 2, 4 , 2 ,4).  sudoku_board( 2, 5 , 2, 5 ).  sudoku_board( 2, 6 , 2 , 6).
sudoku_board( 2, 7 , 3 ,4).  sudoku_board( 2, 8 , 3 ,5).  sudoku_board( 2, 9 , 3 , 6).

sudoku_board( 3, 1 , 1 ,7).  sudoku_board( 3, 2 , 1 ,8).  sudoku_board( 3, 3 , 1 ,9).
sudoku_board( 3, 4 , 2 ,7).  sudoku_board( 3, 5 , 2 ,8).  sudoku_board( 3, 6 , 2 , 9).
sudoku_board( 3, 7 , 3 ,7).  sudoku_board( 3, 8 , 3 ,8).  sudoku_board( 3, 9 , 3 ,9). 

sudoku_board( 4, 1 , 4 ,1).  sudoku_board( 4, 2 , 4 ,2).  sudoku_board( 4, 3 , 4 ,3).
sudoku_board( 4, 4 , 5 ,1 ).  sudoku_board( 4, 5 , 5 ,2).  sudoku_board( 4, 6 , 5 , 3).
sudoku_board( 4, 7 , 6 ,1 ).  sudoku_board( 4, 8 , 6 , 2).  sudoku_board( 4, 9 , 6 , 3).

sudoku_board( 5, 1 , 4 , 4).  sudoku_board( 5, 2 , 4 ,5).  sudoku_board( 5, 3 , 4 ,6).
sudoku_board( 5, 4 , 5 ,4).  sudoku_board( 5, 5 , 5,5 ).  sudoku_board( 5, 6 , 5 , 6).
sudoku_board( 5, 7 , 6 ,4).  sudoku_board( 5, 8 , 6 ,5).  sudoku_board( 5, 9 , 6 ,6).

sudoku_board( 6, 1 , 4,7).   sudoku_board( 6, 2 , 4 ,8).  sudoku_board( 6, 3 , 4 ,9).
sudoku_board( 6, 4 , 5 ,7).  sudoku_board( 6, 5 , 5 , 8).  sudoku_board( 6, 6 , 5 , 9).
sudoku_board( 6, 7 , 6 ,7).  sudoku_board( 6, 8 , 6 ,8).  sudoku_board( 6, 9 , 6 ,9).

sudoku_board( 7, 1 , 7 ,1).  sudoku_board( 7, 2 , 7 ,2).  sudoku_board( 7, 3 , 7 ,3).
sudoku_board( 7, 4 , 8 ,1).  sudoku_board( 7, 5 , 8 ,2).  sudoku_board( 7, 6 , 8 ,3).
sudoku_board( 7, 7 , 9 ,1).  sudoku_board( 7, 8 , 9 ,2).  sudoku_board( 7, 9 , 9 ,3).

sudoku_board( 8, 1 , 7 ,4).  sudoku_board( 8, 2 , 7,5 ).  sudoku_board( 8, 3 , 7 ,6).
sudoku_board( 8, 4 , 8 ,4).  sudoku_board( 8, 5 , 8 ,5).  sudoku_board( 8, 6 , 8 ,6).
sudoku_board( 8, 7 , 9 ,4).  sudoku_board( 8, 8 , 9 , 5).  sudoku_board( 8, 9 , 9 , 6).

sudoku_board( 9, 1 , 7 ,7).  sudoku_board( 9, 2 , 7 ,8).  sudoku_board( 9, 3 , 7 ,9).
sudoku_board( 9, 4 , 8 ,7).  sudoku_board( 9, 5 , 8 ,8).  sudoku_board( 9, 6 , 8 ,9).
sudoku_board( 9, 7 , 9 ,7).  sudoku_board( 9, 8 , 9 ,8).  sudoku_board( 9, 9 , 9 , 9).



% nill, 0, means without digit , in other words an unfilled cell. Row, Column, value of cell
sudoku_puzzle_state( 1, 1 , 5 ). sudoku_puzzle_state( 1, 2 , 3 ).  sudoku_puzzle_state( 1, 3 , 0 ).
sudoku_puzzle_state( 1, 4 , 0 ). sudoku_puzzle_state( 1, 5 , 7 ).  sudoku_puzzle_state( 1, 6 , 0 ).
sudoku_puzzle_state( 1, 7 , 0 ). sudoku_puzzle_state( 1, 8 , 0 ).  sudoku_puzzle_state( 1, 9 , 0 ).

sudoku_puzzle_state( 2, 1 , 6 ). sudoku_puzzle_state( 2, 2 , 0 ).  sudoku_puzzle_state( 2, 3 , 0 ).
sudoku_puzzle_state( 2, 4 , 1 ). sudoku_puzzle_state( 2, 5 , 9 ).  sudoku_puzzle_state( 2, 6 , 5 ).
sudoku_puzzle_state( 2, 7 , 0 ). sudoku_puzzle_state( 2, 8 , 0 ).  sudoku_puzzle_state( 2, 9 , 0 ).

sudoku_puzzle_state( 3, 1 , 0 ). sudoku_puzzle_state( 3, 2 , 9 ).  sudoku_puzzle_state( 3, 3 , 8 ).
sudoku_puzzle_state( 3, 4 , 0 ). sudoku_puzzle_state( 3, 5 , 0 ).  sudoku_puzzle_state( 3, 6 , 0 ).
sudoku_puzzle_state( 3, 7 , 0 ). sudoku_puzzle_state( 3, 8 , 6 ).  sudoku_puzzle_state( 3, 9 , 0 ).

sudoku_puzzle_state( 4, 1 , 8 ). sudoku_puzzle_state( 4, 2 , 0 ).  sudoku_puzzle_state( 4, 3 , 0 ).
sudoku_puzzle_state( 4, 4 , 0 ). sudoku_puzzle_state( 4, 5 , 6 ).  sudoku_puzzle_state( 4, 6 , 0 ).
sudoku_puzzle_state( 4, 7 , 0 ). sudoku_puzzle_state( 4, 8 , 0 ).  sudoku_puzzle_state( 4, 9 , 3 ).

sudoku_puzzle_state( 5, 1 , 4 ). sudoku_puzzle_state( 5, 2 , 0 ).  sudoku_puzzle_state( 5, 3 , 0 ).
sudoku_puzzle_state( 5, 4 , 8 ). sudoku_puzzle_state( 5, 5 , 0 ).  sudoku_puzzle_state( 5, 6 , 3 ).
sudoku_puzzle_state( 5, 7 , 0 ). sudoku_puzzle_state( 5, 8 , 0 ).  sudoku_puzzle_state( 5, 9 , 1 ).

sudoku_puzzle_state( 6, 1 , 7 ). sudoku_puzzle_state( 6, 2 , 0 ).  sudoku_puzzle_state( 6, 3 , 0 ).
sudoku_puzzle_state( 6, 4 , 0 ). sudoku_puzzle_state( 6, 5 , 2 ).  sudoku_puzzle_state( 6, 6 , 0 ).
sudoku_puzzle_state( 6, 7 , 0 ). sudoku_puzzle_state( 6, 8 , 0 ).  sudoku_puzzle_state( 6, 9 , 6 ).

sudoku_puzzle_state( 7, 1 , 0 ). sudoku_puzzle_state( 7, 2 , 6 ).  sudoku_puzzle_state( 7, 3 , 0 ).
sudoku_puzzle_state( 7, 4 , 0 ). sudoku_puzzle_state( 7, 5 , 0 ).  sudoku_puzzle_state( 7, 6 , 0 ).
sudoku_puzzle_state( 7, 7 , 2 ). sudoku_puzzle_state( 7, 8 , 8 ).  sudoku_puzzle_state( 7, 9 , 0 ).

sudoku_puzzle_state( 8, 1 , 0 ). sudoku_puzzle_state( 8, 2 , 0 ).  sudoku_puzzle_state( 8, 3 , 0 ).
sudoku_puzzle_state( 8, 4 , 4 ). sudoku_puzzle_state( 8, 5 , 1 ).  sudoku_puzzle_state( 8, 6 , 9 ).
sudoku_puzzle_state( 8, 7 , 0 ). sudoku_puzzle_state( 8, 8 , 0 ).  sudoku_puzzle_state( 8, 9 , 5 ).

sudoku_puzzle_state( 9, 1 , 0 ). sudoku_puzzle_state( 9, 2 , 0 ).  sudoku_puzzle_state( 9, 3 , 0 ).
sudoku_puzzle_state( 9, 4 , 0 ). sudoku_puzzle_state( 9, 5 , 8 ).  sudoku_puzzle_state( 9, 6 , 0 ).
sudoku_puzzle_state( 9, 7 , 0 ). sudoku_puzzle_state( 9, 8 , 7 ).  sudoku_puzzle_state( 9, 9 , 9 ).

row( 1 ).  row( 2 ).  row( 3 ).   row( 4 ).  row( 5 ).
row( 6 ).  row( 7 ).  row( 8 ).   row( 9 ).

column( 1 ).  column( 2 ).  column( 3 ).   column( 4 ).  column( 5 ).
column( 6 ).  column( 7 ).  column( 8 ).   column( 9 ).

quad( 1 ).  quad( 2 ).  quad( 3 ).   quad( 4 ).  quad( 5 ).
quad( 6 ).  quad( 7 ).  quad( 8 ).   quad( 9 ).

sudoku_number( 1 ).  sudoku_number( 2 ).  sudoku_number( 3 ).   sudoku_number( 4 ).  sudoku_number( 5 ).
sudoku_number( 6 ).  sudoku_number( 7 ).  sudoku_number( 8 ).   sudoku_number( 9 ).



assert_initial_puzzle_constraints():- retractall( is_puzzle_constraint(_,_)),
 sudoku_puzzle_state( R, C , State ), State > 0,
 assert( is_puzzle_constraint( R, C ) ), fail , !.
assert_initial_puzzle_constraints():- !.

list_without_zero( [], [], [] ):- !.
list_without_zero( [ Num | State_list ], State_list2, [ Num | State_list3 ] ):- Num == 0 , !,
 list_without_zero( State_list , State_list2 , State_list3 ).
list_without_zero( [ Num | State_list ], [ Num |State_list2],  State_list3  ):- !,
 list_without_zero( State_list , State_list2 , State_list3 ).


sudoku_row_state_nd( Row_n,  State  ):-     sudoku_board( Row_n, Col_n, _Quad_n , _ ), sudoku_puzzle_state( Row_n, Col_n , State ).
sudoku_column_state_nd( Col_n,  State  ):-  sudoku_board( Row_n, Col_n, _Quad_n , _ ), sudoku_puzzle_state( Row_n, Col_n , State ).
sudoku_quad_state_nd( Quad_n ,  State  ):-  sudoku_board( Row_n, Col_n, Quad_n , _ ),  sudoku_puzzle_state( Row_n, Col_n , State ).


get_row_state( Row_n, State_list ):-    findall( State, sudoku_row_state_nd( Row_n, State ), State_list ), ! .
get_column_state( Col_n, State_list ):- findall( State, sudoku_column_state_nd( Col_n, State ), State_list ), ! .
get_quad_state( Quad_n, State_list ):-  findall( State, sudoku_quad_state_nd( Quad_n, State ), State_list ), ! .

get_quad_state2( Row, Col, Quad_n, State_list ):-  sudoku_board( Row, Col , Quad_n, _  ), get_quad_state( Quad_n, State_list ).
%  findall( State, sudoku_quad_state_nd( Quad_n, State ), State_list ), ! .
%----
% arbitrary score currently, if HAS NO dubble  numbers 
%score_for_dubbles( State_list , 10 ):- sort( State_list, State_list2 ),  length( State_list2, Lex ),
% length( State_list, Lex0 ), Lex0 == Lex , !.
%score_for_dubbles( _State_list , -20 ):-  !.
%--
%list_has_dubbles( State_list ):- sort( State_list, State_list2 ),  length( State_list2, Lex ),
% length( State_list, Lex0 ), Lex0 \= Lex , !.

%----
%score_for_state_list( State_list , Score ):- !, list_without_zero( State_list, State_list2, _ ),
% length( State_list2, Le ), score_for_dubbles( State_list2 , Score2 ), Score is Le + Score2 .

%--
%apply_candidate( [], _, _Position, _Candidate, [] ):- !.
%apply_candidate( [ _H | State_list ], Pos, Position, Candidate, [ Candidate | State_list2 ] ):- 
% Pos == Position, !, Pos2 is Pos + 1,
% apply_candidate(  State_list , Pos2, Position, Candidate, State_list2 ).
%apply_candidate( [ H | State_list ], Pos, Position, Candidate, [ H | State_list2 ] ):- !,
%  Pos2 is Pos + 1,
% apply_candidate(  State_list , Pos2, Position, Candidate, State_list2 ). 

%---
% i,i,i,i,i,o
%get_position_in_quad2( Row_n, Col_n, Count ,[ R | _Rows ] , [ C | _Cols ], Count ):-  R == Row_n, C == Col_n, !.
%get_position_in_quad2( Row_n, Col_n, Count ,[ _ | Rows ] , [ _ | Cols ], Result ):- Count2 is Count + 1,
% get_position_in_quad2( Row_n, Col_n, Count2 , Rows  ,  Cols , Result ).

%----
%get_position_in_quad( Row_n, Col_n, Quad_n , Position ):- !,
% findall( Row, sudoku_board( Row, _ , Quad_n ,_), Rows ),
% findall( Col, sudoku_board( _, Col, Quad_n , _), Cols ),
% get_position_in_quad2( Row_n, Col_n, 0, Rows, Cols, Position ).

%get_row_score( Row_n , Col_n, Candidate, Score ):-    !,
% get_row_state( Row_n, State_list ),    
% apply_candidate( State_list, 1, Col_n, Candidate, State_list2 ),
% score_for_state_list( State_list2 , Score ).

%get_column_score( Row_n , Col_n, Candidate,  Score ):- !,
% get_column_state( Col_n, State_list ), 
% apply_candidate( State_list, 1, Row_n, Candidate, State_list2 ),
% score_for_state_list( State_list2 , Score ).

%get_quad_score( Row_n , Col_n, Candidate,  Score ):-  !,
%  sudoku_board( Row_n, Col_n, Quad_n ,_), 
%  get_position_in_quad( Row_n, Col_n, Quad_n , Position ),
%  get_quad_state( Quad_n, State_list ),  
%  apply_candidate( State_list, 1, Position, Candidate, State_list2 ),
%  score_for_state_list( State_list2 , Score ).


%is_member( Num, Cou, [ Num | _State_list ], Cou ):- !.
%is_member( Num, Cou, [ _ | State_list ] , Res ):-  Cou2 is Cou + 1, is_member( Num, Cou2, State_list, Res ), !.


%number_is_present_in_cell_sections( Row_n, _Col, Num, is_in_row , Nth ):-  get_row_state( Row_n, State_list ), is_member( Num, 1, State_list, Nth ),!.
%number_is_present_in_cell_sections( _Row_n, Col_n, Num, is_in_col , Nth ):-  get_column_state( Col_n, State_list ), is_member( Num, 1, State_list, Nth ),!.
%number_is_present_in_cell_sections( Row_n, Col_n, Num, is_in_quad , Nth ):-  sudoku_board( Row_n, Col_n, Quad_n ,_),
% get_quad_state( Quad_n, State_list ),  is_member( Num, 1, State_list, Nth ), ! .

%number_is_not_present_in_cell_sections( Row_n, Col_n, Num ):-  number_is_present_in_cell_sections( Row_n, Col_n, Num, _, _ ), !, fail .
%number_is_not_present_in_cell_sections( _Row_n, _Col_n, _Num ):- !.
%---
% find_soduko_cell_for_quad_nth( Quad_n, Xnth , Row2, Col2 ):-


%--
%reset_cell( Row, _Col, is_in_row, Xnth ):- !, assign_sudoku_cell_with_number( Row, Xnth , 0 ).
%reset_cell( _Row, Col, is_in_col, Xnth ):- !, assign_sudoku_cell_with_number( Xnth , Col, 0 ).
%reset_cell( Row, Col, is_in_quad, Xnth ):- sudoku_board( Row, Col, Quad_n, _  ), 
%   sudoku_board( Row2, Col2, Quad_n, Xnth ), 
%    !, assign_sudoku_cell_with_number( Row2, Col2 , 0 ).


%matches_as_state( [H|Current_state], Col, Candidate_number, [_H2|False_state], Cou, Score, Match_score ):-   Cou = Col, 
% H == Candidate_number, !, Cou2 is Cou + 1,  Score2 is Score + 1,
%  matches_as_state( Current_state, Col, Candidate_number, False_state, Cou2, Score2, Match_score ).

%matches_as_state( [], []  ):-  !.

%matches_as_state( [H|Current_state],  [H2|False_state] ):-   H = H2, !,
%    matches_as_state( Current_state, False_state ).

%matches_as_state( [_|Current_state], Col, Candidate_number, [_|False_state], Cou, Score, Match_score ):-   !,
%  Cou2 is Cou + 1,  
%  matches_as_state( Current_state, Col, Candidate_number, False_state, Cou2, Score, Match_score ).

  
%matches_as_state( [H|Current_state], Col, Candidate_number, False_state, Cou, 0, Match_score ):-
%---
%does_match_with_false_state( Current_state, Row, _Col, _Candidate_number ):-
%  false_row_state( Row, False_state ),
  % matches_as_state( Current_state, Col, Candidate_number, False_state, 1, 0, Match_score ),
%  matches_as_state( Current_state,  False_state ), !.
  % Match_score > 6 ,!.

%---
%  ( i,i,i) i think
%does_not_match_with_false_trace( Row, Col, Candidate_number ):-
%    get_row_state( Row, Row_state ), 
%	apply_candidate( Row_state, 1, Col, Candidate_number, State_list2 ),
%	false_row_trace( Row, False_state ),
%	matches_as_state( State_list2,  False_state ), 
%	!, fail.
%does_not_match_with_false_trace( _Row, _Col, _Candidate_number ):- !.

%  ( i , i, o )
%is_possible_candidate_for_cell( Row, Col, Candidate_number ):-
%  sudoku_number( Candidate_number ) ,  
%  number_is_not_present_in_cell_sections( Row, Col, Candidate_number ),
%   does_not_match_with_false_trace( Row, Col, Candidate_number ).
 
 % get_row_state( Row, State_row ), 
  % not( false_row_state( Row, Col , Candidate_number ) ).
%---
%is_secundary_candidate_for_cell( Row, Col, Candidate_number , Is_in_sect, Xnth ):-
%  sudoku_number( Candidate_number ) ,   
%  number_is_present_in_cell_sections( Row, Col, Candidate_number, Is_in_sect, Xnth ), !, 
%  reset_cell( Row, Col, Is_in_sect, Xnth ).


%---
%get_possible_candidates_for_cell( Row, Col,  Candidate_numbers , primairy_candidate, not_in_sect, 0 ):- 
%    findall( Cand, is_possible_candidate_for_cell( Row, Col, Cand ),  Candidate_numbers ), !.
	% length( Candidate_numbers, Lex ), Lex > 0, ! .

% temp turn of
%get_possible_candidates_for_cell( Row, Col,  [ Candidate_number ] , secondary_candidate, Is_in_sect, Xnth ):- 
%  is_secundary_candidate_for_cell( Row, Col, Candidate_number, Is_in_sect, Xnth ),!.

%---

%score_candidate( Candidate, Row_n, Col_n, Score ):-  
% get_row_score( Row_n , Col_n, Candidate, Score_of_row ) , 
% get_column_score( Row_n , Col_n , Candidate, Score_of_column ), 
% get_quad_score( Row_n , Col_n, Candidate, Score_of_quad ), !,
% Score is Score_of_row + Score_of_column + Score_of_quad.
%score_candidate( _Cand, _Row, _Col, 0 ):- !.
%---
%score_candidates( Candidate_numbers, Row, Col, Candidate_scores ):- !,
%  score_candidates2( Candidate_numbers, Row, Col, Candidate_scores ).
%---
%score_candidates2( [] , _Row, _Col, [] ):- !.
%score_candidates2( [ Cand | Candidate_numbers ] , Row, Col, [ Score | Candidate_scores ] ):- !,
%  score_candidate( Cand, Row, Col, Score ),
%score_candidates2( Candidate_numbers, Row, Col, Candidate_scores ).
%---
% i,i,i,i,o,o
%take_highest_score(  [], Result_score, Result_score ):- !.
%take_highest_score( [ Score | Candidate_scores ], Highest_score, Result_score ):-  Score > Highest_score, !,
%take_highest_score(  Candidate_scores,  Score,  Result_score ).
%take_highest_score(  [ _Score | Candidate_scores],  Highest_score, Result_score ):- !,
% take_highest_score(  Candidate_scores,  Highest_score,  Result_score ).
%---
%take_highest_scoring_candidates( [], [], _High_score, [], [], [], [] ):- !.
%take_highest_scoring_candidates( [C | Candidate_numbers], [Sc|Candidate_scores], High_score, [C|High_candidates], [Sc|High_scores], NonCands, NonScores ):-
% Sc == High_score, !,
% take_highest_scoring_candidates( Candidate_numbers, Candidate_scores, High_score, High_candidates, High_scores, NonCands, NonScores ).
%take_highest_scoring_candidates( [C | Candidate_numbers], [Sc|Candidate_scores], High_score, High_candidates, High_scores, [C|NonCands], [Sc|NonScores] ):- !,
% take_highest_scoring_candidates( Candidate_numbers, Candidate_scores, High_score, High_candidates, High_scores, NonCands, NonScores ).

%---
% no need to chage the orther probably because the states are already pretty random in memory
regenerate_field_stack():- not( field_stack( _, _ ) ), ! ,
 sleep( 5 ),   write( "REGENERATE STACK" ), nl, 
 regenerate_field_stack2(), retractall( false_candidate( _, _, _, _ ) ),
 assert_initial_puzzle_constraints(), !.
regenerate_field_stack():- !.
 
%--- 
regenerate_field_stack2():-    
  sudoku_puzzle_state( Row, Col, State ), State == 0,  assert( field_stack( Row, Col ) ), fail, !.
regenerate_field_stack2():-  !.

%---
% temporarly


% todo. currently accept as solved if there are no zeros which is not a valid judgement for sudoku
puzzle_is_complete( is_completed ):- 
 %show_doubles(),
 %there_are_no_doubles(),
 findall( State, sudoku_puzzle_state( _ , _ , State ) , State_list ),
 list_without_zero( State_list, State_list2, _ ),
 length( State_list2 , Leng ), 
 write_term( current_score( Leng, 81 ), [] ) , nl, 
 % here check for if there are doubles 
 Leng == 81 , 
 !.


puzzle_is_complete( is_not_completed ):- !. 

% puzzle_is_complete(), !,
%---
assign_sudoku_cell_with_number( Row, Col , Candidate ):-
 retract( sudoku_puzzle_state( Row, Col , _ ) ) , !, asserta( sudoku_puzzle_state( Row, Col , Candidate ) ) .

% should not be neccesary to catch
% assign_sudoku_cell_with_number( _, _, _ ):- !.
%---  o,o,o

% sudoku_puzzle_states_to_complete_nd( Row, Col , State ):-  sudoku_puzzle_state( Row, Col , State ),  State == 0 .
% sudoku_puzzle_states_to_complete_nd( Row, Col , State ):-  sudoku_puzzle_state( Row, Col , State ),  State \= 0 .

%---
%there_are_no_doubles():- there_are_doubles(), !, fail.
%there_are_no_doubles():- !.
%---
%there_are_doubles():- row( Row_n ),  get_row_state( Row_n, State_list ),  list_without_zero( State_list, State_list2, _ ),
%  list_has_dubbles( State_list2 ), !.
%there_are_doubles():-
%column( Col_n ),  get_column_state( Col_n, State_list ),  list_without_zero( State_list, State_list2, _ ),
%  list_has_dubbles( State_list2 ), !.

%there_are_doubles():-
%quad( Quad_n ),  get_quad_state( Quad_n , State_list ),  list_without_zero( State_list, State_list2, _ ),
%  list_has_dubbles( State_list2 ), !.


%--
%show_doubles():-  row( Row_n ),  get_row_state( Row_n, State_list ),  list_without_zero( State_list, State_list2, _ ),
%  list_has_dubbles( State_list2 ),
%  write_term( row_has_doubles( Row_n, State_list ) , [] ), nl, fail, !.

%show_doubles():-  column( Col_n ),  get_column_state( Col_n, State_list ),  list_without_zero( State_list, State_list2, _ ),
%  list_has_dubbles( State_list2 ),
%  write_term( column_has_doubles( Col_n, State_list ) , [] ), nl, fail, !.

%show_doubles():-  quad( Quad_n ),  get_quad_state( Quad_n , State_list ),  list_without_zero( State_list, State_list2, _ ),
%  list_has_dubbles( State_list2 ),
%  write_term( quad_has_doubles( Quad_n, State_list ) , [] ), nl, fail, !.

%show_doubles():- !.

%--
display_result( Message ):- write( Message ), nl,
 %sudoku_board( Row, Col, _ , _), 
 %sudoku_puzzle_state( Row, Col , State ),
 %write_term( sudoku_puzzle_state( Row, Col , State ) , [] ), nl, 
 show_full_state(),
 fail, !.

% display_result(_):-    show_doubles(), !.
display_result(_):-  !.



%----


increment_level( N2 ):- retract( level( N ) ),!, N2 is N + 1,  assert( level( N2 ) ).

increment_try( N2 ):- retract( xtry( N ) ),!, N2 is N + 1,  assert( xtry( N2 ) ).

show_state( Row, Col ):- !,
    get_row_state( Row, State_row ), write_term( row_state( Row, State_row ) , [] ), nl, 
    get_column_state( Col, State_col ),write_term( col_state( Col , State_col ) , [] ), nl, 
    get_quad_state2( Row, Col, Quadn, State_quad ), write_term( quad_state( Quadn, State_quad ) , [] ), nl.
%--
%show_full_state_if_new_row_begins( is_new_row ):- show_full_state(), sleep( 1 ) , !.
%show_full_state_if_new_row_begins( _Is_new_row ):-!.





% :- dynamic cell_candidate/3.
%  :- dynamic cell_candidates/3.


%----
%get_candidate_for_cell( Row, Col , Candidate ):-  
%  retract( cell_candidate( Row, Col, Candidates ) ), 
%  Candidates = [ Candidate | Rest ], 
%  get_possible_candidates_for_cell( Row, Col,  Candidate_numbers ),
%  not( member( Candidate, Candidate_numbers ) ),
%  assert( cell_candidate( Row, Col, Rest ) ), !.

%get_candidates_for_cell( Row, Col , High_candidates, Type_of_candidate , Is_where, Xnth):-
%    get_possible_candidates_for_cell( Row, Col,  Candidate_numbers , Type_of_candidate , Is_where, Xnth), 
%	score_candidates( Candidate_numbers, Row, Col, Candidate_scores ),  
%    take_highest_score( Candidate_scores, -100, High_score ), 
%	take_highest_scoring_candidates( Candidate_numbers, Candidate_scores, High_score, High_candidates, _High_scores, _, _ ), !.

    
	% length( High_candidates, Lex ), Lex > 0 , !,
	% High_candidates = [ Candidate | _Restx ].

%---
 % sudoku_board( 9, 7 , 9 ,7).  sudoku_board( 9, 8 , 9 ,8).  sudoku_board( 9, 9 , 9 , 9).


% assert_false_cell_states():-   row( Row ),
%    retract( row_trace( Row, Row_state ) ),
%      list_without_zero( Row_state, Row_state2, _ ), length( Row_state2, Lex ), Lex > 7,
%	  assert( false_row_trace( Row, Row_state ) ),  fail, !.
% assert_false_cell_states():- !.
%----
% reset_states_to_zero():- 
%  sudoku_board( R, C , _ , _),  not( is_puzzle_constraint( R, C ) ),
%  assign_sudoku_cell_with_number( R, C , 0 ),   fail, !.
% reset_states_to_zero:- !.

%---



%update_current_row( Row, is_new_row ):- current_row( Row2 ), Row2 \= Row, !, retractall( current_row( _ ) ),
% assert( current_row( Row ) ).
%update_current_row( Row, is_not_new_row ):- 
% retractall( current_row( _ ) ), assert( current_row( Row ) ), !.

%----
%assert_false_states():-  
%  assert_false_cell_states(), reset_states_to_zero(), fail , !.

%assert_false_states():- !.
% here beacuse it cant find possible candidates , it finds secundary candidates which resets
% the 1 field which would otherwise be violated 

	
	%retractall( cell_candidates( Row, Col, _ ) ),
	%assert( cell_candidates( Row, Col, Restx ) ).
	% member( Member_candidate, High_candidates ), !.
%----
%assign_backtrack_value_for_cell( Row, Col ) :-  retractall( cell_candidate( Row, Col, _ ) ),
%  cell_candidates( Row, Col, High_candidates ), High_candidates = [ Candidate | Rest ], !,
%  assert( cell_candidates( Row, Col, Rest ) ),
%  assert( cell_candidate( Row, Col, Candidate ) ).
%assign_backtrack_value_for_cell( _Row, _Col ) :- !.

get_candidates_remaining( Row , Col , Member_candidates  ):-
 findall( Num, sudoku_number( Num ), Numlist ),
 get_row_state( Row, State_list1 ), list_without_zero( State_list1 , State_list1x , _ ),
 get_column_state( Col, State_list2 ), list_without_zero( State_list2 , State_list2x , _ ),
 get_quad_state2( Row, Col, _Quad_n, State_list3 ), list_without_zero( State_list3 , State_list3x , _ ),
 append( State_list1x, State_list2x, State_listpx ), append( State_listpx, State_list3x, State_listqx ),
 sort( State_listqx, State_listqx2 ),
 subtract( Numlist , State_listqx2, Member_candidates ) , !.



        % ( i , i, o )
    % ( i, i, i, o )
%reset_fields( Level ):-
%  write_term( reset_level( Level ) , [] ), nl,
%  retract( field_trace( Row, Col , Level2 ) ), 
%  Level2 > Level,
%  assign_sudoku_cell_with_number( Row, Col , 0 ), fail .
  
%  fail , ! .
%reset_fields( _ ):- !.

%---
%reset_fields_above_level( Row, Col ):-
%  	sudoku_board( Row2, Col2 , _ , _ ), Row2 >= Row, Col2 >= Col,
%    not( is_puzzle_constraint( Row2, Col2 ) ),
%	assign_sudoku_cell_with_number( Row2, Col2 , 0 ),  fail, !.

%reset_fields_above_level( _Row, _Col ):- !.
% get_candidates_remaining( Row , Col , Member_candidates  ),


% update_current_row( Row, Is_new_row ),
% assign_backtrack_value_for_cell( Row, Col ) ,
%write( "\nstart search for cell : " ), write_term( sudoku_cell( Row, Col ) , [] ), nl, 
% sleep( Speed ), 
 % assign_sudoku_cell_with_number( Row, Col , 0 ),  
 % show_full_state_if_new_row_begins( Is_new_row ),
% if_candidate_list_is_empty_assert_false_states_rest_and_fail( Member_candidates ),
% Member_candidates = [ Member_candidate | _ ],
%write( "found candidate : " ), write_term( found_in( Type_of_candidate, Is_where, Xnth ), [] ), write( " " ),  
%write_term( candidate( Member_candidate ) , [] ), nl, 
% sleep( Speed ),  
	% assert( field_trace( Row, Col , Level ) ), 
	% sleep( 1 ),
    % row_state(),
	% get_row_state( Row, Row_state_list ),
	% assert( row_trace( Row, Row_state_list ) ),
	% show_state( Row, Col ),

% try_assign_field( Row, Col ):-
	% get_candidates_remaining( Row , Col , Member_candidates  ),
    % member( Memberx, Member_candidates ), !,
	% write( "assign cell : " ), write_term( sudoku_member( Row, Col , Memberx,  Member_candidates ) , [] ), nl, 
    % assign_sudoku_cell_with_number( Row, Col , Memberx ).

% sudoku_board( Row, Col , _ , _ ), 
 %  sudoku_number( Row ),	sudoku_number( Col ),
 %  incr( Level ), 
 %  reset_fields_above_level( Row, Col ),
 %  not( is_puzzle_task( Row, Col ) ),
 %     retractall( field_trace( _, _ , _ ) ),  
 % HAS metta Sort? and how to do assert ? with a space predicate? or with bind ?
 % Second implement
 %  here Only change the First cell  matching candidates where 1 element can be taken off
 % backtrack_candidates( Attempt_level ):-
 % re_assign_first_candidate_that_can_be_backtracked
 % retract( cell_candidates( Row, Col, Candidates ) ),
 % backtrack_candidates().
%  sudoku_number( Row ),	sudoku_number( Col ),
 %  incr( Level ), 
 %  reset_fields_above_level( Row, Col ),
 
field_in_stack( fs( Row, Col ) ):-   field_stack( Row, Col ).

show_stack():- 
    findall( Field, field_in_stack( Field ), Field_list ), 
	write_term( Field_list   , [] ), nl, 
	fail, !.
show_stack():- !.        


show_full_state():- 
    row( Row ),
	get_row_state( Row, State_row ), write_term( row_state( Row, State_row ) , [] ), write("."), nl, 
	fail, !.
show_full_state():- !.        

%get_speed( 3 ):-!.
get_speed( 1 ):-!.
%----
show_candidate_state():- 
    cell_candidates( Row, Col, Candidates ),
    write_term( cell_candidates( Row, Col, Candidates ) , [] ), nl, 
	fail, !.
show_candidate_state():- !.        

%----



%--
repeatx().
repeatx():- 
  % show_full_state(), 
  % nl,  
  %solution_is_violated(),
  write( " REPEAT" ), nl, nl, 
  % increment_level( Newlevel ), 
      regenerate_field_stack(),
  % puzzle_is_complete( is_not_completed ):-    not( field_stack( _, _ ) ),  regenerate_field_stack(), !.  
  sleep( 1 ), 
  level( Level ), 
  Level < 83,
  write_term( current_level_in_repeat( Level ) , [] ), nl,
  %Border is C - 1 ,
  %reset_fields( Border ),
  % retractall( tel( _ ) ),  assert( tel( 0 ) ), 
  %assert_false_states(), 
  % sleep(3),
 repeatx().




assert_possible_candidates_for_unfilled_cells2():-
 sudoku_board( Row, Col , _ , _ ), 
 not( is_puzzle_constraint( Row, Col ) ),
 sudoku_puzzle_state( Row, Col , Exist_cand ),  Exist_cand == 0 , 
 get_candidates_remaining( Row , Col , Candidates  ),
 retractall( cell_candidates( Row, Col, _ ) ), 
 assert( cell_candidates( Row, Col, Candidates ) ), 
 fail , ! .
assert_possible_candidates_for_unfilled_cells2():- !. 
 


% first clause is do nothing because the candidates are already re-asserted after the violation 
% assert_possible_candidates_for_unfilled_cells( _Attempt_level ):-  solution_is_violated() , !.
% assert candidates in normal fashion 
assert_possible_candidates_for_unfilled_cells():- !,  assert_possible_candidates_for_unfilled_cells2(). 
%----

undo_fields_for_level( Attempt_level ) :- 
 retract( trace_field_assigned( Attempt_level, Row, Col ) ) ,
 assign_sudoku_cell_with_number( Row, Col , 0 ),  fail , ! .
undo_fields_for_level( _Attempt_level ) :- !. 

%---
%re_assign_first_cell_candidates_that_can_be_backtracked( Level ):-
% trace_field_assigned( Level, Row, Col ),
% cell_candidates( Row, Col, Candidates ), 
% Candidates = [ _ , Cand | Rest ] , 
%  write_term( backtrack_take_of_1element( Level, Row, Col, Candidates ), [] ), nl,  	 
% retract( cell_candidates( Row, Col, _ ) ), !, 
% assert( cell_candidates( Row, Col, [ Cand | Rest ] ) ).
%re_assign_first_cell_candidates_that_can_be_backtracked( _ ):- !.
%--
% i,i,i,i,o,o
filterout_used_candidates( _Level, _Row, _Col , [], [] , [] ):- !.
filterout_used_candidates( Level, Row, Col , [H|Candidates], [H|Previous_candidates] , Rest ):-
  false_candidate( Level , Row , Col , H )  , !,
  filterout_used_candidates( Level, Row, Col , Candidates, Previous_candidates , Rest ).
 
filterout_used_candidates( Level, Row, Col , [H|Candidates], Previous_candidates , [H|Rest] ):-
  filterout_used_candidates( Level, Row, Col , Candidates, Previous_candidates , Rest ).
 
 % minimum of 2 candidates
 % Remaining_candidates = [ _Last_used_candidate , _  | _Rest ] , 
 % member( Last_applied_candidate , Candidates ),
 % not(  
%---
% o,o,o,o

find_first_field_which_had_alternatives( Level, Row, Col , Last_used_candidate ):-
 trace_field_assigned_reverse( Level, Row, Col ) ,
 cell_candidates( Row, Col, Candidates ), 
 filterout_used_candidates( Level, Row, Col , Candidates, _, Remaining_candidates  ),
 % minimum of 2 candidates
 Remaining_candidates = [ Last_used_candidate , _  | _Rest ] , !.
 % member( Last_applied_candidate , Candidates ),
 % not(  false_candidate( Level , Row , Col , Last_applied_candidate ) ) , ! . 
  


%--
% false_candidate( _, _ , _ , _ )

%------
rewind_to_level( Current_level, Field_level , _Row , _Col , _LastUsed_candidate ):-
 write( "RESET BACK TO LEVEL: " ), 
 Field_level2 is Field_level - 1 , 
 write( Field_level2 ), write( " FROM LEVEL: " ), write( Current_level ),
 % save_state_to_file0(),
 nl, 
 % Field_level2 is Field_level - 0 , 
 retractall( level( _ ) ), assert( level( Field_level2 ) ), fail, ! .

rewind_to_level( _, Field_level , _Row , _Col , _LastUsed_candidate ):-  retractall( trace_remove( _, _, _  ) ),
 trace_field_assigned_reverse( Level, Row, Col ) , Level >= Field_level ,
 write_term( reset_field_above_level( Row, Col )   , [] ) , nl,
 assert( trace_remove( Level, Row, Col ) ),
 assign_sudoku_cell_with_number( Row, Col , 0 ), fail , ! .

rewind_to_level( _, _Field_level , _Row , _Col , _LastUsed_candidate ):-
 trace_remove( Level, Row, Col ), retract( trace_field_assigned_reverse( Level, Row, Col ) ), fail, !.

% assign_sudoku_cell_with_number( Row, Col , 0 ), fail , ! .

rewind_to_level( _, Field_level , _Row , _Col , _LastUsed_candidate ):-
 trace_field_assigned( Level, Row, Col ) , Level >= Field_level ,
 % TODO HERE 
 retract( trace_field_assigned( Level, Row, Col ) ),
 write_term( re_asserta_stack( Row, Col )  , [] ) , nl,
 asserta( field_stack( Row, Col ) ), fail , ! .

%rewind_to_level( _, _Field_level , _Row , _Col , _LastUsed_candidate ):-
% retract( trace_field_assigned( _Level, Row, Col ) ), 
% write_term( re_assertz_stack( Row, Col )  , [] ) , nl,
% assertz( field_stack( Row, Col ) ), fail , ! .

% IS ALREAY MARKED AS false_candidate here !!  no its not ?

rewind_to_level( _, Field_level , Row , Col , LastUsed_candidate ):-
  % retractall( trace_field_assigned_reverse( _ , _ , _ ) ),
  write( "ASSERT FALSE CANDIDATE: \n" ), 
  % write_term( false_candidate( Field_level , Row , Col , LastUsed_candidate ), [] ), nl , 
  write_term( false_candidate( Row , Col ), [] ), nl , 
  % DOUBT if we should  reset  also this field 
  % sleep( 3 ), 
  assert( false_candidate( Field_level , Row , Col , LastUsed_candidate ) ) , !.

% assign_sudoku_cell_with_number( Row, Col , 0 ), 

rewind_to_level( _, _Field_level , _Row , _Col , _LastUsed_candidate ):-!.

%  re_assign_first_candidate_that_can_be_backtracked
%---
if_the_possible_solution_is_violated_reassert_to_backtrack_candidates( Is_violated_yes_no, Current_level ):-
  Is_violated_yes_no == is_violated , !,
  find_first_field_which_had_alternatives( Field_level , Row , Col , Marked_as_applied_candidate ) ,
  write( "FOUND ALTERNATIVES AT LEVEL: " ), write( Field_level ), nl,  
  rewind_to_level( Current_level, Field_level , Row , Col , Marked_as_applied_candidate ).

  % re_assign_first_cell_candidates_that_can_be_backtracked( Level ) ,
  % undo_fields_for_level( Level ).
%  backtrack_candidates( Attempt_level ).

if_the_possible_solution_is_violated_reassert_to_backtrack_candidates( _Puzzle_is_solved, _Attempt_level ):- !.

%---
check_if_there_are_cells_which_have_no_possible_candidates_anymore( is_not_completed, is_violated ):-
 sudoku_board( Row, Col , _ , _ ), 
 not( is_puzzle_constraint( Row, Col ) ),
 sudoku_puzzle_state( Row, Col , Exist_cand ),  Exist_cand == 0 , 
 get_candidates_remaining( Row , Col , Member_candidates  ),
 Member_candidates = [] , 
 assert( solution_is_violated() ),
 write_term( is_vio_has_no_candidates( Row , Col ) , [] ), nl,
 get_speed( Speed ), sleep( Speed ) ,
 save_state_to_file0( Row, Col ),
 ! .
check_if_there_are_cells_which_have_no_possible_candidates_anymore( is_completed , is_not_violated ):- !.
%---
%cell_unfilled( cell_with_score( Freedom, Row, Col ) ):-  sudoku_board( Row, Col , _ , _ ), 
% not( is_puzzle_constraint( Row, Col ) ),
% sudoku_puzzle_state( Row, Col , Exist_cand ),  Exist_cand == 0 , 
% get_candidates_remaining( Row , Col , Member_candidates  ), 
% length( Member_candidates, Lex ), Freedom is Lex + 0.
 
 % Member_candidates = [] ,

%---
% cells_list_to_be_filled_sorted( Cxl ):-   findall( Cx, cell_unfilled( Cx ), Cxl ).
 % temp not sort
 % sort( Cxl, Cells_list ).
%---
% not( solution_is_violated() ), 

%member_nd_of_list_if_there_is_no_violation( Cells_list, Cellx ):-
% member( Cellx, Cells_list ).

%----	
% assert_possible_candidates_for_unfilled_cells( Attempt_level ) ,



create_field_stack():- retractall( field_stack( _, _ ) ),
 sudoku_board( Row, Col , _ , _ ), 
 not( is_puzzle_constraint( Row, Col ) ),
 assert( field_stack( Row, Col ) ), fail, ! .
create_field_stack():- !. 
%---
take_field_from_stack( Row, Col ):- retract( field_stack( Row, Col ) ), ! .

%--
find_false_candidate( fc( Row , Col ) ):- false_candidate( _Field_level2 , Row , Col , _Cand2 ) .


%----
it_is_a_false_candidate( Field_level , Row , Col , Cand ):-
  % write( "SEARCH if this is a false candidate lev row col cand " ), nl , 
  % write( " " ), write_term( xcandidate( Field_level , Row , Col , Cand ) , [] ) , nl,
  false_candidate( Field_level2 , Row2 , Col2 , Cand2 ),
  % write( "check with this candidate : " ),   write_term( false_candidate( Field_level2 , Row2 , Col2 , Cand2 ) , [] ) , nl,
  Field_level == Field_level2 , 
  Row == Row2 , 
  Col == Col2 , 
  Cand == Cand2, 
  write( "IS FOUND IN FALSE : " ), nl,  
  % sleep( 4 ),
  !.

% REMOVE WHOLE CLAUSE  after testing
it_is_a_false_candidate( _Field_level , _Row , _Col , _Cand ):-
 write( "IS NOT IN FALSE : " ), nl,  
 % sleep( 4 ), 
 fail , ! . 

%---
it_is_not_a_false_candidate( Field_level , Row , Col , Cand ):-
 it_is_a_false_candidate( Field_level , Row , Col , Cand ), !, fail.
it_is_not_a_false_candidate( _Field_level , _Row , _Col , _Cand ):- 
 
 % temp turn off 
 % findall( False_candidate, find_false_candidate( False_candidate ), Fcl ), write_term( Fcl, [] ), nl,
 !.
 
 % not( false_candidate( Field_level , Row , Col , Cand ) ),




candidate_for_cell( Field_level , Row , Col , Cand ):-
 % which_cell_to continue_with( Row, Col , Cand ),
 %sudoku_board( Row, Col , _ , _ ), 
 %not( is_puzzle_task( Row, Col ) ),
 % sudoku_puzzle_state( Row, Col , Exist_cand ),  Exist_cand == 0 , 
 cell_candidates( Row , Col , Member_candidates ),
 % Member_candidates = [ Cand | _ ] , 
 member( Cand, Member_candidates ),
 it_is_not_a_false_candidate( Field_level , Row , Col , Cand ),
 % not( false_candidate( Field_level , Row , Col , Cand ) ),
 write( " choose from candidates " ) , write_term( candidates_list( Member_candidates ) , [] ) , 
 write( "\n choose " ) , write( Cand ), nl, 
 % write_term( cell_x( Member_candidates , Row, Col, Cand ) , [] ), nl, 
 write_term( cell_x( Row, Col ) , [] ), nl, 
 % sleep( 1 ),
 !.
 % Member_candidates = [] , 
	%cells_list_to_be_filled_sorted( Cells_list ),
	%write( "debug3\n" ), 
	%member_nd_of_list_if_there_is_no_violation( Cells_list, Cellx ),
	% not( solution_is_violated() ), 
	%write( "debug4\n" ), 
	%Cellx = cell_with_score( _Freedom, Row, Col ) ,
    %write( "debug5\n" ), 
    % candidate_for_cell( Row, Col, Candidate_number ),
	%cell_candidates( Row, Col, Candidates ), Candidates = [ Cand | _ ],
%---


save_state_to_file2( Fn_absolute ,  Row, Col ):-  tell( Fn_absolute ), 
 write_term( violated_field( Row, Col ) , [] ), write( "." ), nl,
 show_full_state(), told(), !.
 %sudoku_puzzle_state( Row, Col , State ),
 %write_term( sudoku_puzzle_state( Row, Col , State ), [] ), write( "." ), nl, 
 %fail.
save_state_to_file2( _Fn_absolute , _ , _ ):- told(), !.

%---
% soduko_name( Name ),
sudoku_name( 'default' ):- !.

atom3_fill( 1, '00' ):- !.
atom3_fill( 2, '0' ):-!.
atom3_fill( _, '' ):-!.
%---
save_state_to_file0( Row, Col ):-	sudoku_name( Name ), xtry( Current_try ),  
    % atom_number( Numb_at, Current_try ), 
    atom_number( Numb_at, Current_try ), atom_length( Numb_at , Le ), atom3_fill( Le, Atx ),
	
	atomic_list_concat( [ 'results/sudoku_' , Name,  Atx, Numb_at, '.pro' ] , Fn_absolute ), 
    save_state_to_file2( Fn_absolute, Row, Col ), 		!.
save_state_to_file0( _ , _ ):- !.


%log_state_if_row_changes( Row ):- last_row( Row_previous ),  Row_previous \= Row , !,
% save_state_to_file0( 0, 0 ),
% retractall( last_row( _ ) ),  assert( last_row( Row ) ).
%log_state_if_row_changes( _Row ):-!.

start_resolve_sudoku():-  retractall( level( _ ) ),  assert( level( 0 ) ), retractall( last_row( _ ) ),  assert( last_row( 0 ) ), 
    retractall( xtry( _ ) ),  assert( xtry( 0 ) ), 
    retractall( trace_field_assigned( _, _ , _ ) ),  retractall( false_candidate( _, _ , _ , _ ) ),
	retractall( trace_field_assigned_reverse( _, _ , _ ) ),
    save_state_to_file0( 0, 0 ),
	assert_initial_puzzle_constraints(),
	
	% retractall( sudoku_puzzle_state( _ , _ , _ ) ), consult( 'results/sudoku_state_38.pro' ),
	
	% tell( 'results/solution_trace_sudoku.pro' ),
    create_field_stack(),	repeatx(),    show_stack(),
    
	take_field_from_stack( Row, Col ), increment_try( Try_count ),
	% log_state_if_row_changes( Row ),
	write_term( field_from_stack( Try_count, Row, Col ) , [] ), nl,  
	increment_level( Level ),
	% sudoku_board( Row, Col , _ , _ ),     not( is_puzzle_constraint( Row, Col ) ),
	assert_possible_candidates_for_unfilled_cells() ,
    candidate_for_cell( Level, Row, Col , Cand ),
	assign_sudoku_cell_with_number( Row, Col , Cand ),  
	assert(  trace_field_assigned( Level, Row, Col ) ),
	asserta( trace_field_assigned_reverse( Level, Row, Col ) ),
	%  assert_possible_candidates_for_unfilled_cells() ,
	write_term( assign_cell( Row, Col , Cand ) , [] ), nl,  	 
	show_full_state(),
	puzzle_is_complete( Puzzle_is_succes_solved ), 
	write_term( is_complete( Puzzle_is_succes_solved ) , [] ), nl,  
	check_if_there_are_cells_which_have_no_possible_candidates_anymore( Puzzle_is_succes_solved, Is_violated_yes_no ),
	write_term( is_violated( Is_violated_yes_no ) , [] ) ,  nl, 
	if_the_possible_solution_is_violated_reassert_to_backtrack_candidates( Is_violated_yes_no, Level ) ,
	% sleep( 10 ),
	Puzzle_is_succes_solved == is_completed,
	!,
    % told(),
	display_result( "puzzle seems complete :" ),
	save_state_to_file0( 0 , 0 ).
%	level( Current_level ),
%    atom_number( Numb_at, Current_level ), 
%    atomic_list_concat( [ 'results/soduku_state_' , Numb_at, '.pro' ] , Fn_absolute ),
%    save_state_to_file( Fn_absolute ).
	

start_resolve_sudoku():- 
  % told(),
  display_result("puzzle Not complete :"),
	save_state_to_file0( 0, 0 ),
%    save_state_to_file( Fn_absolute ).
 !.

 
write_cell( _Vr , _Vc, Row, Col, Val ):-  sudoku_puzzle_state( Row2, Col2 , Sta ), 
 Row == Row2, Col == Col2, Sta > 0, !,
 write(" <td class=\"yellow_cell\"> "), write( Val ), write(" </td> "), !.
 
write_cell( Vr , Vc, Row, Col, _Val ):-  Vr \= 0, Vc \= 0, Vr == Row, Vc == Col, write(" <td class=\"red_cell\"> "), write( "&nbsp" ), write(" </td> "), !.
write_cell( _Vr , _Vc, _Row, _Col, Val ):-  Val == 0, write(" <td> "), write( "&nbsp" ), write(" </td> "), !.
write_cell( _Vr , _Vc, _Row, _Col, Val ):-  write(" <td> "), write( Val ), write(" </td> "), !.


write_row( Vr , Vc, Row, [ C1,C2,C3, C4,C5,C6, C7,C8,C9 ] ):-
 write("\n<tr>\n"),
 write_cell( Vr , Vc, Row, 1, C1 ), write_cell( Vr , Vc, Row, 2, C2 ), write_cell( Vr , Vc, Row, 3, C3 ),
 write_cell( Vr , Vc, Row, 4, C4 ), write_cell( Vr , Vc, Row, 5, C5 ), write_cell( Vr , Vc, Row, 6, C6 ),
 write_cell( Vr , Vc, Row, 7, C7 ), write_cell( Vr , Vc, Row, 8, C8 ), write_cell( Vr , Vc, Row, 9, C9 ),
 write("\n</tr>\n").


write_table( Count, Vr , Vc, [ R1,R2,R3, R4,R5,R6, R7,R8,R9 ] ):- !,
 write("<br> &nbsp <br> "),
 write( Count ),  write(" <hr>  "), nl,
 write("<table border=1 cellpadding=3 cellspacing=0 class=\"sd_table\">"),
 write_row( Vr , Vc, 1, R1 ), write_row( Vr , Vc, 2, R2 ), write_row( Vr , Vc, 3, R3 ),
 write_row( Vr , Vc, 4, R4 ), write_row( Vr , Vc, 5, R5 ), write_row( Vr , Vc, 6, R6 ),
 write_row( Vr , Vc, 7, R7 ), write_row( Vr , Vc, 8, R8 ), write_row( Vr , Vc, 9, R9 ),
 write("\n</table>").

write_table( _Count,  _Vr , _Vc, _Xswl ):-!.


:- dynamic sudo_state/2.
% YOU MUST EXIT and RELOAD before to create the visualisation
create_visualisation():-  Dir = 'results/', retractall( sudo_state( _, _ , _, _ ) ),
 retractall( xtry( _ ) ),  assert( xtry( 0 ) ), 
 directory_files( Dir, Lis ), 
 sort( Lis, Lisx ), 
 member( El, Lisx ), El \= '..' , El \= '.' ,
 increment_try( Count ),
 write( El ), nl, 
 atomic_list_concat( [ 'results/', El ], Fn ),
 retractall( violated_field( _ , _ ) ),
 retractall( row_state( _ , _ ) ),
 consult( Fn ),
 violated_field( Vr , Vc ),
 findall( Xsw, row_state( _ , Xsw ), Xswl ),
 assert( sudo_state( Count, Vr , Vc, Xswl ) ),
 fail, ! .
create_visualisation():- tell( 'results/visualisation.htm' ), 
 
 write( "<html> <head> "),
 write("<style>"), nl,
  write(".sd_table  { border: 1px solid #000000 ; width: 250px ; height: 250px ; padding: 2px; background-color: FFFFFF } ") , nl,
  write(".red_cell  { background-color: red ; } ") , 
  write(".yellow_cell  { background-color: #FEFFB7 ; } ") , 
 
  write("</style>"), nl,
 write( "</head><body style=\"background-color: C0C0C0\">  <center>" ), 
 nl, write( "<h1> Metta-Prolog Sudoku Constraint-solver </h1> <hr> " ), nl, 
 sudo_state( Count, Vr , Vc, Xswl ),
 % write_term( sudo_state( Count, Vr , Vc, Xswl ), [] ), 
 write_table( Count, Vr , Vc, Xswl ),
 nl, 
 fail, ! .


create_visualisation():-  write( "\n </body> </html> " ), 

 told(), !.














