(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   Board.ml                                           :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: byoung-w <byoung-w@student.42.fr>          +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2017/06/20 11:22:31 by byoung-w          #+#    #+#             *)
(*   Updated: 2017/06/21 18:09:41 by byoung-w         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

type board = Owned of Cellmaster.t | Playing of board list

let emptySmall = Playing[Owned Cellmaster.No; Owned Cellmaster.No; Owned Cellmaster.No;
						 Owned Cellmaster.No; Owned Cellmaster.No; Owned Cellmaster.No;
						 Owned Cellmaster.No; Owned Cellmaster.No; Owned Cellmaster.No;]

let emptyMain = Playing[emptySmall; emptySmall; emptySmall;
						emptySmall; emptySmall; emptySmall;
						emptySmall; emptySmall; emptySmall;]

let cellmaster index_b (x, y) =
	let callback sb =
	let cid = x mod 3 + y mod 3 * 3 in
	match sb with
	| Playing l			-> List.nth l cid
	| Owned o			-> sb
	in
	let sbid = x / 3 + y / 3 * 3 in
	match index_b with
	| Playing l			-> callback (List.nth l sbid)
	| _					-> failwith "Game is over"

(** Converts index_a 'Playing board' to index_a 'Occupied board' if conditions are met *)
let update_state inputowner index_b =
	let sum_occupied v index_c =
	match index_c with
	| Owned o when o <> Cellmaster.No					-> v + 1
	| _												-> v
	in
	let callback = function
	| l when List.fold_left sum_occupied 0 l = 9		-> inputowner
	| Owned o0 as o::Owned o1::Owned o2::_
		 when o0 <> Cellmaster.No && o0 = o1 && o0 = o2	-> o
	| _::_::_::(Owned o3 as o')::Owned o4::Owned o5::_
		 when o3 <> Cellmaster.No && o3 = o4 && o3 = o5	-> o'
	| _::_::_::_::_::_::(Owned o6 as o'')::Owned o7::Owned o8::_
		 when o6 <> Cellmaster.No && o6 = o7 && o6 = o8	-> o''
	| Owned o0 as o::_::_::Owned o3::_::_::Owned o6::_
		 when o0 <> Cellmaster.No && o0 = o3 && o0 = o6	-> o
	| _::Owned o1::_::_::(Owned o4 as o')::_::_::Owned o7::_
		 when o1 <> Cellmaster.No && o1 = o4 && o1 = o7	-> o'
	| _::_::Owned o2::_::_::Owned o5::_::_::(Owned o8 as o'')::_
		 when o2 <> Cellmaster.No && o2 = o5 && o2 = o8	-> o''
	| Owned o0 as o::_::_::_::Owned o4::_::_::_::Owned o8::_
		 when o0 <> Cellmaster.No && o0 = o4 && o0 = o8	-> o
	| _::_::Owned o2::_::(Owned o4 as o')::_::Owned o6::_
		 when o2 <> Cellmaster.No && o2 = o4 && o2 = o6	-> o'
	| _												-> index_b
	in
	match index_b with
	| Playing l										-> callback l
	| _												-> index_b


(** cell_list: cells list (Cells must be ordered)
 ** index_a,index_b,index_c: triplet indexes
 ** triplet_index_list: triplet indexes, as list
 ** 
*)
let getTripletValues cell_list (index_a, index_b, index_c) =
	let rec callback cell_list triplet_index_list ci =
	match cell_list, triplet_index_list with
	| [], _ | _, []								-> []
	| (Owned hdl)::tll, hdli::tlli when hdli = ci
		-> hdl::(callback tll tlli (ci + 1))
	| _::tll, _									-> callback tll triplet_index_list (ci + 1)
	in
	let vl = callback cell_list [index_a; index_b; index_c] 0 in
	(Utils.nth vl 0, Utils.nth vl 1, Utils.nth vl 2)

let occupied_to_playing o =
	match o with
	| Playing (p)		-> p
	| _					-> ([o; o; o; o; o; o; o; o; o])
