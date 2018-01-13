(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   MiniBoard.ml                                           :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: byoung-w <byoung-w@student.42.fr>          +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2017/09/20 17:28:05 by byoung-w          #+#    #+#             *)
(*   Updated: 2017/09/20 18:05:35 by byoung-w         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

type board = Occupied of Cellmaster.t | Field of board list


let miniTicTacToe = Field[Occupied Cellmaster.EMPTY; Occupied Cellmaster.EMPTY; Occupied Cellmaster.EMPTY;
						 Occupied Cellmaster.EMPTY; Occupied Cellmaster.EMPTY; Occupied Cellmaster.EMPTY;
						 Occupied Cellmaster.EMPTY; Occupied Cellmaster.EMPTY; Occupied Cellmaster.EMPTY;]

let megaTicTacToe = Field[miniTicTacToe; miniTicTacToe; miniTicTacToe;
						miniTicTacToe; miniTicTacToe; miniTicTacToe;
						miniTicTacToe; miniTicTacToe; miniTicTacToe;]

let cellmaster index_b (x, y) =
	let callback sb =
	let cid = x mod 3 + y mod 3 * 3 in
	match sb with
	| Field l			-> List.nth l cid
	| Occupied o			-> sb
	in
	let sbid = x / 3 + y / 3 * 3 in
	match index_b with
	| Field l			-> callback (List.nth l sbid)
	| _					-> failwith "Game Over"

(** Converts index_a 'Field board'
 to index_a 'Occupied board' if conditions
 are met *)
let update_state inputowner index_b =
	let sum_occupied v index_c =
	match index_c with
	| Occupied o when o <> Cellmaster.EMPTY					-> v + 1
	| _												-> v
	in
	let callback = function
	| l when List.fold_left sum_occupied 0 l = 9		-> inputowner
	| Occupied o0 as o::Occupied o1::Occupied o2::_
		 when o0 <> Cellmaster.EMPTY && o0 = o1 && o0 = o2	-> o
	| _::_::_::(Occupied o3 as o')::Occupied o4::Occupied o5::_
		 when o3 <> Cellmaster.EMPTY && o3 = o4 && o3 = o5	-> o'
	| _::_::_::_::_::_::(Occupied o6 as o'')::Occupied o7::Occupied o8::_
		 when o6 <> Cellmaster.EMPTY && o6 = o7 && o6 = o8	-> o''
	| Occupied o0 as o::_::_::Occupied o3::_::_::Occupied o6::_
		 when o0 <> Cellmaster.EMPTY && o0 = o3 && o0 = o6	-> o
	| _::Occupied o1::_::_::(Occupied o4 as o')::_::_::Occupied o7::_
		 when o1 <> Cellmaster.EMPTY && o1 = o4 && o1 = o7	-> o'
	| _::_::Occupied o2::_::_::Occupied o5::_::_::(Occupied o8 as o'')::_
		 when o2 <> Cellmaster.EMPTY && o2 = o5 && o2 = o8	-> o''
	| Occupied o0 as o::_::_::_::Occupied o4::_::_::_::Occupied o8::_
		 when o0 <> Cellmaster.EMPTY && o0 = o4 && o0 = o8	-> o
	| _::_::Occupied o2::_::(Occupied o4 as o')::_::Occupied o6::_
		 when o2 <> Cellmaster.EMPTY && o2 = o4 && o2 = o6	-> o'
	| _												-> index_b
	in
	match index_b with
	| Field l										-> callback l
	| _												-> index_b


(** cell_list: cells list (Cells must be ordered)
 ** index_a,index_b,index_c: moveset indexes
 ** moveset_index_list: moveset indexes, as list
 ** 
*)
let getMovesetValues cell_list (index_a, index_b, index_c) =
	let rec callback cell_list moveset_index_list ci =
	match cell_list, moveset_index_list with
	| [], _ | _, []								-> []
	| (Occupied hdl)::tll, hdli::tlli when hdli = ci
		-> hdl::(callback tll tlli (ci + 1))
	| _::tll, _									-> callback tll moveset_index_list (ci + 1)
	in
	let vl = callback cell_list [index_a; index_b; index_c] 0 in
	(Tools.nth vl 0, Tools.nth vl 1, Tools.nth vl 2)

let occupied_to_playing o =
	match o with
	| Field (p)		-> p
	| _					-> ([o; o; o; o; o; o; o; o; o])
