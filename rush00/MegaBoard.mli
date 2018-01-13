(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   MegaBoard.mli                                      :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: byoung-w <byoung-w@student.42.fr>          +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2017/09/20 17:28:05 by byoung-w          #+#    #+#             *)
(*   Updated: 2017/09/20 18:05:35 by byoung-w         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

val update_state : Board.board -> Board.board -> Board.board
val inject_input : Board.board -> int * int -> Cellmaster.t -> Board.board
val getLineMoveset : Board.board -> int -> int -> Board.board list
val getColMoveset : Board.board -> int -> int -> Board.board list
val getDiagMoveset : Board.board -> int -> int -> Board.board list
val getcell_xy : int -> int -> int * int
val getSbMoveset : Board.board -> int -> int * int * int -> Board.board list
