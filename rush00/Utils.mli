(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   Utils.mli                                          :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: byoung-w <byoung-w@student.42.fr>          +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2017/06/21 16:37:58 by byoung-w          #+#    #+#             *)
(*   Updated: 2017/06/21 16:37:59 by byoung-w         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

val str_is : (char -> bool) -> string -> bool
val str_is_int : string -> bool
val prompt_line : string -> bool -> string
val prompt_string : string -> string
val nth : 'a list -> int -> 'a
