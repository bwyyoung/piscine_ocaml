(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   Ncurses.mli                                        :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: byoung-w <byoung-w@student.42.fr>          +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2017/06/21 16:37:29 by byoung-w          #+#    #+#             *)
(*   Updated: 2017/06/21 17:41:48 by byoung-w         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

val init : unit -> unit
val deinit : unit -> unit
val get_input : Board.board -> int * int
val draw : Board.board -> unit
val print : string -> unit
