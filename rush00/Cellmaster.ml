(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   Cellmaster.ml                                      :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: byoung-w <byoung-w@student.42.fr>          +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2017/06/20 11:30:02 by byoung-w          #+#    #+#             *)
(*   Updated: 2017/06/21 16:47:26 by byoung-w         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

(** No: No Cellmaster;
 ** P1: Player1;
 ** P2: Player2 *)
type t = No | P1 | P2

let next = function
	| P1			-> P2
	| P2			-> P1
	| No			-> No

let char_cellmaster = function
	| No					-> '.'
	| P1					-> 'O'
	| P2					-> 'X'

let sumMasters (a, b, c) =
	let rec callback l ((sa, sb, sc) as t) =
	match l with
	| []					-> t
	| No::tl				-> callback tl (sa + 1, sb, sc)
	| P1::tl				-> callback tl (sa, sb + 1, sc)
	| P2::tl				-> callback tl (sa, sb, sc + 1)
	in
	callback [a; b; c] (0, 0, 0)
