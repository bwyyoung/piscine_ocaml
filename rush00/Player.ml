(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   Player.ml                                          :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: byoung-w <byoung-w@student.42.fr>          +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2017/09/20 17:28:05 by byoung-w          #+#    #+#             *)
(*   Updated: 2017/09/20 18:05:35 by byoung-w         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

type t = Cellmaster.t * string * Cellmaster.t * string
let new_players name1 name2 = (Cellmaster.P1, name1, Cellmaster.P2, name2)
let type_of_player (c, _, _, _) = c
let string_of_player (_, name, _, _) = name
let char_of_player (c, _, _, _) = Cellmaster.char_cellmaster c
let next (p1, n1, p2, n2) = (p2, n2, p1, n1)
