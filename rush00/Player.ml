(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   Player.ml                                          :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: byoung-w <byoung-w@student.42.fr>          +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2017/06/20 17:15:36 by byoung-w          #+#    #+#             *)
(*   Updated: 2017/06/20 17:25:39 by byoung-w         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

type t = Owner.t * string * Owner.t * string

let new_players name1 name2 = (Owner.P1, name1, Owner.P2, name2)

let next (p1, n1, p2, n2) = (p2, n2, p1, n1)

let type_of_player (c, _, _, _) = c
let string_of_player (_, name, _, _) = name
let char_of_player (c, _, _, _) = Owner.char_of_owner c
