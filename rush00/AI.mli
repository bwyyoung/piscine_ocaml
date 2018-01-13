(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   AI.mli                                             :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: byoung-w <byoung-w@student.42.fr>          +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2017/09/20 17:28:05 by byoung-w          #+#    #+#             *)
(*   Updated: 2017/09/20 18:05:35 by byoung-w         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

val moveset1 : (int * int * int) list
val moveset2 : (int * int * int) list
val sbindex : int list
val empty_moves : 'a list list
val choose_random_subposition : MiniBoard.board list * int -> int * int
val choose_random_position : MiniBoard.board list -> int * int
val any_no_coord :
	int -> int * int * int -> Cellmaster.t * Cellmaster.t * Cellmaster.t -> int * int
val push_match : 'a list list -> int -> 'a -> 'a list list
val foreach_movesets :
	int * int * int ->
	MiniBoard.board list -> int -> (int * int) list list -> (int * int) list list
val foreach_movesets_diag :
	int * int * int ->
	MiniBoard.board list -> int -> (int * int) list list -> (int * int) list list
val check_movesets :
	MiniBoard.board list -> int -> (int * int) list list -> (int * int) list list
val foreach_subboards : MiniBoard.board list -> (int * int) list list
val get_best_move : MiniBoard.board list -> int * int
val get_input : MiniBoard.board -> int * int
