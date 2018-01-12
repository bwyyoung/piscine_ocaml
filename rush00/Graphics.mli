(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   Graphics.mli                                       :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: byoung-w <byoung-w@student.42.fr>          +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2017/06/19 17:28:05 by byoung-w          #+#    #+#             *)
(*   Updated: 2017/06/19 18:05:35 by byoung-w         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

val init : unit -> unit
val destroy : unit -> unit
val get_input : Board.board -> int * int
val render : Board.board -> unit
val print : string -> unit
