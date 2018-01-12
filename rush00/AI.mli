(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   AI.mli                                             :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: byoung-w <byoung-w@student.42.fr>          +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2017/06/21 09:20:57 by byoung-w          #+#    #+#             *)
(*   Updated: 2017/06/21 18:24:57 by byoung-w         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

val moveset1 : (int * int * int) list
val moveset2 : (int * int * int) list
val sbindex : int list
val empty_moves : 'a list list
val choose_random_subposition : Board.board list * int -> int * int
val choose_random_position : Board.board list -> int * int
val any_no_coord :
	int -> int * int * int -> Cellmaster.t * Cellmaster.t * Cellmaster.t -> int * int
val push_match : 'a list list -> int -> 'a -> 'a list list
val foreach_movesets :
	int * int * int ->
	Board.board list -> int -> (int * int) list list -> (int * int) list list
val foreach_movesets_diag :
	int * int * int ->
	Board.board list -> int -> (int * int) list list -> (int * int) list list
val check_movesets :
	Board.board list -> int -> (int * int) list list -> (int * int) list list
val foreach_subboards : Board.board list -> (int * int) list list
val get_best_move : Board.board list -> int * int
val get_input : Board.board -> int * int
