(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   Cellmaster.ml                                      :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: byoung-w <byoung-w@student.42.fr>          +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2017/09/20 17:28:05 by byoung-w          #+#    #+#             *)
(*   Updated: 2017/09/20 18:05:35 by byoung-w         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

(** EMPTY: EMPTY Cell;
 ** P1: Player1;
 ** P2: Player2 *)
type t = EMPTY | P1 | P2

let next = function
	| P1			-> P2
	| P2			-> P1
	| EMPTY			-> EMPTY

let char_cellmaster = function
	| EMPTY					-> '.'
	| P1					-> 'O'
	| P2					-> 'X'

let sumMasters (a, b, c) =
	let rec callback l ((sa, sb, sc) as t) =
	match l with
	| []					-> t
	| EMPTY::tl				-> callback tl (sa + 1, sb, sc)
	| P1::tl				-> callback tl (sa, sb + 1, sc)
	| P2::tl				-> callback tl (sa, sb, sc + 1)
	in
	callback [a; b; c] (0, 0, 0)
