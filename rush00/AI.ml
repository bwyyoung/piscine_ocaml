(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   AI.ml                                              :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: byoung-w <byoung-w@student.42.fr>          +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2017/06/21 09:20:57 by byoung-w          #+#    #+#             *)
(*   Updated: 2017/06/21 18:24:57 by byoung-w         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)


(*moves that the AI can still make *)
let empty_moves = [[]; []; []; []; []]

(*The map slots for our game. we have a square grid of 9 tic tac toe games*)
let triplets1 = [(0, 1, 2); (3, 4, 5); (6, 7, 8); (0, 3, 6);(1, 4, 7); (2, 5, 8)]
let triplets2 = [(0, 4, 8); (2, 4, 6)]

(*board indices for each 'zone'.*)
let sbindex = [0; 1; 2; 3; 4; 5; 6; 7; 8]


(** subboard_index: subboard index
 ** index_a,index_b,index_c: triplet indexes unpacked
 ** triplet_values: triplet values*)
let any_no_coord subboard_index (index_a, index_b, index_c) triplet_values =
	match triplet_values with
	| (_, _, Cellmaster.No)			-> MainBoard.getcell_xy subboard_index index_c
	| (Cellmaster.No, _, _)			-> MainBoard.getcell_xy subboard_index index_a
	| (_, Cellmaster.No, _)			-> MainBoard.getcell_xy subboard_index index_b
	| _							-> failwith "Unreachable!!"

(** list_moves: list matches
 ** list_match_index: list matches index
 ** match_coordinates: match coordinates*)
let push_match list_moves list_match_index match_coordinates =
	let rec callback list_moves list_match_index' =
	match list_moves with
	| []							-> []
	| hd::triplet_list when list_match_index' = list_match_index	-> (match_coordinates::hd)::(callback triplet_list (list_match_index' + 1))
	| hd::triplet_list						-> hd::(callback triplet_list (list_match_index' + 1))
	in
	callback list_moves 0



let foreach_triplets_diag triplet_indexes cell_list subboard_index list_moves =
	let triplet_values = Board.getTripletValues cell_list triplet_indexes in
	let (tval_sumout, np1, tval_sum) = Cellmaster.sumOwners triplet_values in
	if tval_sumout = 1 && np1 = 2 then
	push_match list_moves 0 (any_no_coord subboard_index triplet_indexes triplet_values)
	else if List.length (Utils.nth list_moves 0) = 0 then
	begin
		if tval_sumout = 1 && tval_sum = 2 then
		push_match list_moves 1 (any_no_coord subboard_index triplet_indexes triplet_values)
		else if List.length (Utils.nth list_moves 1) = 0 then
		begin
			if tval_sumout = 2 && np1 = 1 then
			push_match list_moves 2 (any_no_coord subboard_index triplet_indexes triplet_values)
			else if List.length (Utils.nth list_moves 2) = 0 then
			begin
				if tval_sumout = 2 && tval_sum = 1 then
				push_match list_moves 3 (any_no_coord subboard_index triplet_indexes triplet_values)
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

(** triplet_indexes: triplet indexes (int ^3)
 ** triplet_values: triplet values (Cellmaster.t ^3)
 ** tval_sumout,tval_sumin,tval_sum: triplet values summed
 ** cell_list: cell list
 ** subboard_index: subboard index
 ** list_moves: list matches *)
let foreach_triplets triplet_indexes cell_list subboard_index list_moves =
	let triplet_values = Board.getTripletValues cell_list triplet_indexes in
	let (tval_sumout, np1, tval_sum) = Cellmaster.sumOwners triplet_values in
	if tval_sumout = 1 && np1 = 2 then
	push_match list_moves 0 (any_no_coord subboard_index triplet_indexes triplet_values)
	else if List.length (Utils.nth list_moves 0) = 0 then
	begin
		if tval_sumout = 1 && tval_sum = 2 then
		push_match list_moves 1 (any_no_coord subboard_index triplet_indexes triplet_values)
		else if List.length (Utils.nth list_moves 1) = 0 then
		begin
			if tval_sumout = 2 && tval_sum = 1 then
			push_match list_moves 4 (any_no_coord subboard_index triplet_indexes triplet_values)
			else
			list_moves
		end
		else
		list_moves
	end
	else
	list_moves


(** cell_list: cell list
 ** subboard_index: subboard index
 ** list_moves: matches list
 ** triplet_list: triplet list
 ** feach_triplet: foreach_triplet[_diag] function *)
let check_triplets cell_list subboard_index list_moves =
	let rec callback triplet_list feach_triplet list_moves =
	match triplet_list with
	| []							-> list_moves
	| hdt::tlt						-> callback tlt feach_triplet (feach_triplet hdt cell_list subboard_index list_moves)
	in
	let list_moves' = callback triplets1 foreach_triplets list_moves in
	let list_moves' = callback triplets2 foreach_triplets_diag list_moves' in
	list_moves'


	(** subboards_list: subboards list
	** subboard_index_list: subboards indexes list
	** list_moves: matches list
	** cell_list: cell list*)
	let foreach_subboards subboards_list =
		let rec callback subboards_list subboard_index_list list_moves =
			match subboards_list, subboard_index_list with
			| _, _ when List.length (List.hd list_moves) > 0		-> list_moves
			| (Board.Playing cell_list)::triplet_list, hdi::tli				->
				 callback triplet_list tli (check_triplets cell_list hdi list_moves)
			| [], _	| _, []									-> list_moves
			| _::triplet_list, _::tli									->
				 callback triplet_list tli list_moves
	in
	callback subboards_list sbindex empty_moves

(*Choose a random subposition from the grid. the stupidest behaviour*)
let choose_random_subposition (subboards_list, subboard_index) =
	(*callback recursive routine, with combined list as 1st param, and empty list as second param*)
	let rec callback subboards_list subboards_list' =
	match subboards_list with
	| []										-> subboards_list'
	(*check if list is combination of board owned, the Cellmaster number, and
	integer i, ranging towards the last list element. recursively callback last element*)
	| (Board.Occupied Cellmaster.No, i)::triplet_list 			-> callback triplet_list (i::subboards_list')
	| _::triplet_list										-> callback triplet_list subboards_list'
	in
	let cells = callback (List.combine subboards_list [0; 1; 2; 3; 4; 5; 6; 7; 8]) [] in
	let len = List.length cells in
	if len = 0 then
	failwith "unreachable ! ! !"
	else
	MainBoard.getcell_xy subboard_index (Utils.nth cells (Random.int len))


let choose_random_position subboards_list =
	let rec callback subboards_list subboards_list' =
	match subboards_list with
	| []										-> subboards_list'
	| (Board.Playing hd, i)::triplet_list 				-> callback triplet_list ((hd, i)::subboards_list')
	| _::triplet_list										-> callback triplet_list subboards_list'
	in
	let sb = callback (List.combine subboards_list [0; 1; 2; 3; 4; 5; 6; 7; 8]) [] in
	let len = List.length sb in
	if len = 0 then
	failwith "unreachable ! !"
	else
	choose_random_subposition (Utils.nth sb (Random.int len))



(** subboards_list: subboards list
 ** list_moves: list moves *)
let get_best_move subboards_list =
	let list_moves = foreach_subboards subboards_list in
	let rec callback = function
	| []											-> choose_random_position subboards_list
	| hd::triplet_list when List.length hd > 0				-> List.hd hd
	| _::triplet_list											-> callback triplet_list
	in
	callback list_moves

(** b: board *)
let get_input b =
	match b with
	| Board.Playing subboards_list		 -> get_best_move subboards_list
	| _									 -> failwith "Game is over"


