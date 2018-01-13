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


(** megaboard: MegaBoard *)
let update_state inputowner megaboard =
	let f = MiniBoard.update_state inputowner in
	match megaboard with
	| MiniBoard.Field l						-> f (MiniBoard.Field (List.map f l))
	| _										-> megaboard

(** megaboard: MegaBoard;
 ** (x, y) Coords (0-8);
 ** Cellmaster: Cellmaster of the board *)
let inject_input megaboard (x, y) cellmaster =
	let miniboardcellid = x mod 3 + y mod 3 * 3 in
	let map_cells i c =
	if i = miniboardcellid then
		MiniBoard.Occupied cellmaster
	else
		c
	in
	let miniboardid = x / 3 + y / 3 * 3 in
	let map_miniboard i sb =
	match sb with
	| MiniBoard.Field l when i = miniboardid	->
		 MiniBoard.Field (List.mapi map_cells l)
	| _										-> sb
	in
	match megaboard with
	| MiniBoard.Field l							->
	 let megaboard' = MiniBoard.Field (List.mapi map_miniboard l) in
	 update_state (MiniBoard.Occupied cellmaster) megaboard'
	| _										-> failwith "Winner"

let getLineMoveset megaboard sbid lid =
	let rec build_list l cid l' =
	match l with
	| []							-> l'
	| hd::tl when cid / 3 = lid		-> build_list tl (cid + 1) (hd::l')
	| hd::tl 						-> build_list tl (cid + 1) l'
	in
	let callback = function
	| MiniBoard.Field l				-> build_list l 0 []
	| _								-> []
	in
	match megaboard with
	| MiniBoard.Field l					-> callback (List.nth l sbid)
	| _								-> failwith "Winner"

let getColumnMoveset megaboard sbid lid =
	let rec build_coidt l cid l' =
	match l with
	| []							-> l'
	| hd::tl when cid mod 3 = lid	-> build_coidt tl (cid + 1) (hd::l')
	| hd::tl 						-> build_coidt tl (cid + 1) l'
	in
	let callback = function
	| MiniBoard.Field l				-> build_coidt l 0 []
	| _								-> []
	in
	match megaboard with
	| MiniBoard.Field l					-> callback (List.nth l sbid)
	| _								-> failwith "Winner"

let getDiagonalMoveset megaboard sbid did =
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
	| MiniBoard.Field l				-> build_coidt l 0 []
	| _								-> []
	in
	match megaboard with
	| MiniBoard.Field l					-> callback (List.nth l sbid)
	| _								-> failwith "Winner"
												
let getcell_xy sbid cid =
	((sbid mod 3) * 3 + cid mod 3, (sbid / 3) * 3 + cid / 3)

	
let getMiniMoveset megaboard sbid (v, v', v'') =
	let callback = function
	| MiniBoard.Field l				->
		 [List.nth l v; List.nth l v'; List.nth l v'']
	| _								-> []
	in
	match megaboard with
	| MiniBoard.Field l					-> callback (List.nth l sbid)
	| _								-> failwith "Winner"
