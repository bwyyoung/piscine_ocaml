(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   MainBoard.mli                                      :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: byoung-w <byoung-w@student.42.fr>          +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2017/06/19 17:28:05 by byoung-w          #+#    #+#             *)
(*   Updated: 2017/06/19 18:05:35 by byoung-w         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

type board = Occupied of Cellmaster.t | Playing of board list
val emptySmall : board
val emptyMain : board
val update_state : board -> board -> board
val cellmaster : board -> int * int -> board
val getMovesetValues :
	board list -> int * int * int -> Cellmaster.t * Cellmaster.t * Cellmaster.t
val occupied_to_playing : board -> board list
