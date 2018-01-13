(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   MegaBoard.ml                                       :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: byoung-w <byoung-w@student.42.fr>          +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2017/09/20 17:28:05 by byoung-w          #+#    #+#             *)
(*   Updated: 2017/09/20 18:05:35 by byoung-w         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)


(** mainboard: MegaBoard *)
let update_state inputowner mainboard =
	let f = Board.update_state inputowner in
	match mainboard with
	| Board.Field l						-> f (Board.Field (List.map f l))
	| _										-> mainboard

(** mainboard: MegaBoard;
 ** (x, y) Coords (0-8);
 ** Cellmaster: Cellmaster of the board *)
let inject_input mainboard (x, y) cellmaster =
	let subboardcellid = x mod 3 + y mod 3 * 3 in
	let map_cells i c =
	if i = subboardcellid then
		Board.Occupied cellmaster
	else
		c
	in
	let subboardid = x / 3 + y / 3 * 3 in
	let map_subboard i sb =
	match sb with
	| Board.Field l when i = subboardid	->
		 Board.Field (List.mapi map_cells l)
	| _										-> sb
	in
	match mainboard with
	| Board.Field l							->
	 let mainboard' = Board.Field (List.mapi map_subboard l) in
	 update_state (Board.Occupied cellmaster) mainboard'
	| _										-> failwith "Already won"

let getLineMoveset mainboard sbid lid =
	let rec build_list l cid l' =
	match l with
	| []							-> l'
	| hd::tl when cid / 3 = lid		-> build_list tl (cid + 1) (hd::l')
	| hd::tl 						-> build_list tl (cid + 1) l'
	in
	let callback = function
	| Board.Field l				-> build_list l 0 []
	| _								-> []
	in
	match mainboard with
	| Board.Field l					-> callback (List.nth l sbid)
	| _								-> failwith "Already won"

let getColMoveset mainboard sbid lid =
	let rec build_coidt l cid l' =
	match l with
	| []							-> l'
	| hd::tl when cid mod 3 = lid	-> build_coidt tl (cid + 1) (hd::l')
	| hd::tl 						-> build_coidt tl (cid + 1) l'
	in
	let callback = function
	| Board.Field l				-> build_coidt l 0 []
	| _								-> []
	in
	match mainboard with
	| Board.Field l					-> callback (List.nth l sbid)
	| _								-> failwith "Already won"

let getDiagMoveset mainboard sbid did =
	let rec build_coidt l cid l' =
	match l with
	| []							-> l'
	| hd::tl when did = 0 && (cid = 0 || cid = 4 || cid = 8)
		-> build_coidt tl (cid + 1) (hd::l')
	| hd::tl when did = 1 && (cid = 2 || cid = 4 || cid = 6)
		-> build_coidt tl (cid + 1) (hd::l')
	| hd::tl 						-> build_coidt tl (cid + 1) l'
	in
	let callback = function
	| Board.Field l				-> build_coidt l 0 []
	| _								-> []
	in
	match mainboard with
	| Board.Field l					-> callback (List.nth l sbid)
	| _								-> failwith "Already won"
												
let getcell_xy sbid cid =
	((sbid mod 3) * 3 + cid mod 3, (sbid / 3) * 3 + cid / 3)

	
let getSbMoveset mainboard sbid (v, v', v'') =
	let callback = function
	| Board.Field l				->
		 [List.nth l v; List.nth l v'; List.nth l v'']
	| _								-> []
	in
	match mainboard with
	| Board.Field l					-> callback (List.nth l sbid)
	| _								-> failwith "Already won"
