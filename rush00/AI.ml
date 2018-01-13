(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   AI.ml                                              :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: byoung-w <byoung-w@student.42.fr>          +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2017/09/20 17:28:05 by byoung-w          #+#    #+#             *)
(*   Updated: 2017/09/20 18:05:35 by byoung-w         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)


(*moves that the AI can still make *)
let empty_moves = [[]; []; []; []; []]

(*The map slots for our game. we have a square grid of 9 tic tac toe games*)
(*These are all the possible movesets our AI can make*)
let moveset1 = [(0, 1, 2); (3, 4, 5); (6, 7, 8); (0, 3, 6);(1, 4, 7); (2, 5, 8)]
let moveset2 = [(0, 4, 8); (2, 4, 6)]

(*board indices for each 'zone'.*)
let miniboardindex = [0; 1; 2; 3; 4; 5; 6; 7; 8]


(** miniboard_index: miniboard index
 ** index_a,index_b,index_c: moveset indexes unpacked
 ** moveset_values: moveset values*)
let any_no_coord miniboard_index (index_a, index_b, index_c) moveset_values =
	match moveset_values with
	| (_, _, Cellmaster.EMPTY)			-> MegaBoard.getcell_xy miniboard_index index_c
	| (Cellmaster.EMPTY, _, _)			-> MegaBoard.getcell_xy miniboard_index index_a
	| (_, Cellmaster.EMPTY, _)			-> MegaBoard.getcell_xy miniboard_index index_b
	| _							-> failwith "out of bounds!"

(** list_moves: list matches
 ** list_match_index: list matches index
 ** match_coordinates: match coordinates*)
let push_match list_moves list_match_index match_coordinates =
	let rec callback list_moves list_match_index' =
	match list_moves with
	| []							-> []
	| hd::moveset_list when list_match_index' = list_match_index	-> (match_coordinates::hd)::(callback moveset_list (list_match_index' + 1))
	| hd::moveset_list						-> hd::(callback moveset_list (list_match_index' + 1))
	in
	callback list_moves 0


(*our AI can do 3 things:*)
(*1. random move*)
(*2. Block and intercept player from connecting 3*)
(*3. if it sees a possible connect 3, do the connection*)
let check_movesets_diagonal moveset_indexes cell_list miniboard_index list_moves =
	let moveset_values = MiniBoard.getMovesetValues cell_list moveset_indexes in
	let (totalvalue_sum_output, np1, totalvalue_sum) = Cellmaster.sumMasters moveset_values in
	if totalvalue_sum_output = 1 && np1 = 2 then
	push_match list_moves 0 (any_no_coord miniboard_index moveset_indexes moveset_values)
	else if List.length (Tools.nth list_moves 0) = 0 then
	begin
		if totalvalue_sum_output = 1 && totalvalue_sum = 2 then
		push_match list_moves 1 (any_no_coord miniboard_index moveset_indexes moveset_values)
		else if List.length (Tools.nth list_moves 1) = 0 then
		begin
			if totalvalue_sum_output = 2 && np1 = 1 then
			push_match list_moves 2 (any_no_coord miniboard_index moveset_indexes moveset_values)
			else if List.length (Tools.nth list_moves 2) = 0 then
			begin
				if totalvalue_sum_output = 2 && totalvalue_sum = 1 then
				push_match list_moves 3 (any_no_coord miniboard_index moveset_indexes moveset_values)
				else
				list_moves
			end
			else
			list_moves
		end
		else
		list_moves
	end
	else
	list_moves

(** moveset_indexes: moveset index in array
 ** moveset_values: moveset value of index in array
 ** totalvalue_sum_output,totalvalue_sumin,totalvalue_sum: moveset values summed
 ** cell_list: cell list
 ** miniboard_index: miniboard index
 ** list_moves: list matches *)
let check_movesets moveset_indexes cell_list miniboard_index list_moves =
	let moveset_values = MiniBoard.getMovesetValues cell_list moveset_indexes in
	let (totalvalue_sum_output, np1, totalvalue_sum) = Cellmaster.sumMasters moveset_values in
	if totalvalue_sum_output = 1 && np1 = 2 then
	push_match list_moves 0 (any_no_coord miniboard_index moveset_indexes moveset_values)
	else if List.length (Tools.nth list_moves 0) = 0 then
	begin
		if totalvalue_sum_output = 1 && totalvalue_sum = 2 then
		push_match list_moves 1 (any_no_coord miniboard_index moveset_indexes moveset_values)
		else if List.length (Tools.nth list_moves 1) = 0 then
		begin
			if totalvalue_sum_output = 2 && totalvalue_sum = 1 then
			push_match list_moves 4 (any_no_coord miniboard_index moveset_indexes moveset_values)
			else
			list_moves
		end
		else
		list_moves
	end
	else
	list_moves


(** cell_list: cell list
 ** miniboard_index: miniboard index
 ** list_moves: matches list
 ** moveset_list: moveset list
 ** feach_moveset: check_moveset[_diagonal] function *)
(*Our AI can also decide possible places to put his marker, based on the player's input*)
let check_movesets cell_list miniboard_index list_moves =
	let rec callback moveset_list feach_moveset list_moves =
	match moveset_list with
	| []							-> list_moves
	| hdt::tlt						-> callback tlt feach_moveset (feach_moveset hdt cell_list miniboard_index list_moves)
	in
	let list_moves' = callback moveset1 check_movesets list_moves in
	let list_moves' = callback moveset2 check_movesets_diagonal list_moves' in
	list_moves'


	(** miniboards_list: miniboards list
	** miniboard_index_list: miniboards indexes list
	** list_moves: matches list
	** cell_list: cell list*)
	(*Find out the possible positions our AI can move*)
	let check_miniboards miniboards_list =
		let rec callback miniboards_list miniboard_index_list list_moves =
			match miniboards_list, miniboard_index_list with
			| _, _ when List.length (List.hd list_moves) > 0		-> list_moves
			| (MiniBoard.Field cell_list)::moveset_list, hdi::tli				->
				 callback moveset_list tli (check_movesets cell_list hdi list_moves)
			| [], _	| _, []									-> list_moves
			| _::moveset_list, _::tli									->
				 callback moveset_list tli list_moves
	in
	callback miniboards_list miniboardindex empty_moves

(*Choose a random subposition from the grid. the stupidest behaviour*)
let choose_random_subposition (miniboards_list, miniboard_index) =
	(*callback recursive routine, with combined list as 1st param, and empty list as second param*)
	let rec callback miniboards_list miniboards_list' =
	match miniboards_list with
	| []										-> miniboards_list'
	(*check if list is combination of board owned, the Cellmaster number, and
	integer i, ranging towards the last list element. recursively callback last element*)
	| (MiniBoard.Occupied Cellmaster.EMPTY, i)::moveset_list 			-> callback moveset_list (i::miniboards_list')
	| _::moveset_list										-> callback moveset_list miniboards_list'
	in
	let cells = callback (List.combine miniboards_list [0; 1; 2; 3; 4; 5; 6; 7; 8]) [] in
	let len = List.length cells in
	if len = 0 then
	failwith "out of bounds!"
	else
	MegaBoard.getcell_xy miniboard_index (Tools.nth cells (Random.int len))

(*Choose a random position from the grid. the stupidest behaviour*)
let choose_random_position miniboards_list =
	let rec callback miniboards_list miniboards_list' =
	match miniboards_list with
	| []										-> miniboards_list'
	| (MiniBoard.Field hd, i)::moveset_list 				-> callback moveset_list ((hd, i)::miniboards_list')
	| _::moveset_list										-> callback moveset_list miniboards_list'
	in
	let sb = callback (List.combine miniboards_list [0; 1; 2; 3; 4; 5; 6; 7; 8]) [] in
	let len = List.length sb in
	if len = 0 then
	failwith "out of bounds!"
	else
	choose_random_subposition (Tools.nth sb (Random.int len))



(** miniboards_list: miniboards list
 ** list_moves: list moves *)
 (*Find the best possible move based on current number of moves of player, and AI*)
let get_best_move miniboards_list =
	let list_moves = check_miniboards miniboards_list in
	let rec callback = function
	| []											-> choose_random_position miniboards_list
	| hd::moveset_list when List.length hd > 0				-> List.hd hd
	| _::moveset_list											-> callback moveset_list
	in
	callback list_moves

(** b: board reference*)
let get_input b =
	match b with
	| MiniBoard.Field miniboards_list		 -> get_best_move miniboards_list
	| _									 -> failwith "Game Over"


