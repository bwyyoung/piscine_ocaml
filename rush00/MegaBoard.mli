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

val update_state : MiniBoard.board -> MiniBoard.board -> MiniBoard.board
val inject_input : MiniBoard.board -> int * int -> Cellmaster.t -> MiniBoard.board
val getLineMoveset : MiniBoard.board -> int -> int -> MiniBoard.board list
val getColMoveset : MiniBoard.board -> int -> int -> MiniBoard.board list
val getDiagMoveset : MiniBoard.board -> int -> int -> MiniBoard.board list
val getcell_xy : int -> int -> int * int
val getSbMoveset : MiniBoard.board -> int -> int * int * int -> MiniBoard.board list
