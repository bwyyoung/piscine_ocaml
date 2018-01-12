(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   Player.mli                                         :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: byoung-w <byoung-w@student.42.fr>          +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2017/09/20 17:28:05 by byoung-w          #+#    #+#             *)
(*   Updated: 2017/09/20 18:05:35 by byoung-w         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

type t = Cellmaster.t * string * Cellmaster.t * string
val new_players : 'a -> 'b -> Cellmaster.t * 'a * Cellmaster.t * 'b
val next : 'a * 'b * 'c * 'd -> 'c * 'd * 'a * 'b
val type_of_player : 'a * 'b * 'c * 'd -> 'a
val string_of_player : 'a * 'b * 'c * 'd -> 'b
val char_of_player : Cellmaster.t * 'a * 'b * 'c -> char
